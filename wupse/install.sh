#!/bin/sh

set -x

mkdir -p /opt/bin
wget https://raw.githubusercontent.com/coreos/coreos-overlay/master/app-admin/kubelet-wrapper/files/kubelet-wrapper -O /opt/bin/kubelet-wrapper
chmod +x /opt/bin/kubelet-wrapper

cat <<EOF > /etc/systemd/system/kubelet.service
[Unit]
After=rpc-statd.service
Requires=rpc-statd.service

[Service]
Environment=KUBELET_IMAGE_TAG=v1.6.6_coreos.0
Environment="RKT_RUN_ARGS=--uuid-file-save=/var/run/kubelet-pod.uuid \
  --volume=resolv,kind=host,source=/etc/resolv.conf \
  --mount volume=resolv,target=/etc/resolv.conf \
  --volume iscsiadm,kind=host,source=/usr/sbin/iscsiadm \
  --mount volume=iscsiadm,target=/usr/sbin/iscsiadm"
ExecStart=/opt/bin/kubelet-wrapper \
  --allow-privileged \
  --client-ca-file=/etc/kubernetes/ca.pem \
  --cluster_dns=10.1.0.254 \
  --cluster-domain=kubernetes.d26a.de \
  --feature-gates=Accelerators=true \
  --manifest-url=https://raw.githubusercontent.com/BugRoger/dockerfiles/master/wupse/specs/kubernetes.manifest \
  --network-plugin=kubenet \
  --non-masquerade-cidr=10.15.0.0/16 \
  --pod-cidr=10.0.15.0/24 \
  --require-kubeconfig \
  --tls-cert-file=/etc/kubernetes/kubernetes.pem \
  --tls-private-key-file=/etc/kubernetes/kubernetes-key.pem
Restart=always
RestartSec=10

[Install]
WantedBy=multi-user.target
EOF

mkdir -p /var/lib/kubelet
cat <<EOF > /var/lib/kubelet/kubeconfig
apiVersion: v1
kind: Config
clusters:
  - name: local
    cluster:
       certificate-authority: /etc/kubernetes/ca.pem
       server: "https://127.0.0.1"
contexts:
  - name: local 
    context:
      cluster: local
      user: local 
current-context: local
users:
  - name: local
    user:
      client-certificate: /etc/kubernetes/kubelet.pem
      client-key: /etc/kubernetes/kubelet-key.pem
EOF

systemctl daemon-reload
systemctl enable kubelet 
systemctl restart kubelet
