# CoreOS Cuda Installer

This image installs Nvidia's Cuda Toolkit on a CoreOS Container Linux host. It
is useful for not having to bake the Cuda toolkit into each container. It's
really big (1GB+)... 

The image uses a multi-stage Docker build. In the first state a full CoreOS
developer image is being used to install the toolkit using the exact Kernel
sources and headers as the later host.

The second stage just copies the installation to a skinny Alpine image for
transport.

## Installation

```
docker run -v /:/rootfs --privileged bugroger/coreos-cuda-installer:8.0.61
```

This will install the Cuda toolkit to `/opt/cuda/8.0.61`. Additionally,
a symlink to `/opt/cuda/current` will be created.


## Kubernetes

The idea is that the shared libraries are mounted from the host system. This
avoids version mismatch between the hosts shared libraries and what was baked
into the container. Also, it saves copying 1GB of Docker images around.

A spec using this installer looks like this:

```
apiVersion: apps/v1beta1 
kind: Deployment

metadata:
  name: nvidia-settings 
spec:
  replicas: 1 
  strategy: 
    type: Recreate
  template:
    metadata:
      labels:
        app: nvidia-settings
    spec:
      containers:
        - name: nvidia-settings 
          securityContext:
            privileged: true
          image: bugroger/x11:381.22
          imagePullPolicy: Always
          volumeMounts:
            - mountPath: /usr/local/nvidia
              name: nvidia 
            - mountPath: /usr/local/cuda
              name: cuda 
      volumes:
        - name: nvidia
          hostPath:
            path: /opt/nvidia/current
        - name: cuda
          hostPath:
            path: /opt/cuda/current
```

Note the `hostPath` value pointing to `current`. This makes the spec
independant of a specific driver version. Though if required, this can also be
used to pin to a specific version.

## Docker

Unfortunately, the Docker images are not completly unoblivious of this method.
The problem is that the `LD_LIBRARY_PATH` must be set, so that library can be
found.

By convention the Nvidia driver and Cuda libs are expected in `/usr/local/cuda`
and `/usr/local/nvidia`.

This can be prebaked into containers that want to use the mounted libs.

```
RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/
```





