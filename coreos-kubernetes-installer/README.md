# CoreOS Kubernetes Installer

This container installs Kubernetes. Nothing else.

There's no templating or other magic. Replace the certs and adapt the domain,
pod and service subnets and taddaaa. Done Kubernetes.

The certs are the real problem here. This container is using no cheats and
a full set of certificates. I created them similar as described here: https://github.com/sapcc/kubernetes-the-hard-way/blob/master/docs/02-certificate-authority.md

## Usage

```
docker run -v /:/rootfs --privileged bugroger/coreos-kubernetes-installer:wupse.d26a.de
```
