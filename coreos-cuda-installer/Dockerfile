ARG COREOS_VERSION=1409.7.0
ARG CUDA_VERSION=8.0.61

FROM bugroger/coreos-developer:${COREOS_VERSION} as BUILD
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

ARG COREOS_VERSION
ARG CUDA_VERSION

RUN emerge-gitclone
RUN . /usr/share/coreos/release && \
  git -C /var/lib/portage/coreos-overlay checkout build-${COREOS_RELEASE_VERSION%%.*}
RUN emerge -gKv coreos-sources
RUN cp /usr/lib64/modules/$(ls /usr/lib64/modules)/build/.config /usr/src/linux/
RUN make -C /usr/src/linux modules_prepare

WORKDIR /tmp

# RUN curl -v -L "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run" -o /tmp/cuda-run
COPY cuda_8.0.61_375.26_linux-run .
COPY cuda_8.0.61.2_linux.run .
RUN chmod +x cuda_8.0.61_375.26_linux-run  
RUN chmod +x cuda_8.0.61.2_linux.run 
RUN mkdir -p /opt/cuda/${CUDA_VERSION}
RUN ./cuda_8.0.61_375.26_linux-run --toolkit --toolkitpath=/opt/cuda/${CUDA_VERSION} --verbose --silent
RUN ./cuda_8.0.61.2_linux.run --installdir=/opt/cuda/${CUDA_VERSION} --accept-eula --silent
RUN ln -sf /opt/cuda/${CUDA_VERSION} /opt/cuda/current

FROM alpine 
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

ARG CUDA_VERSION=8.0.61

COPY --from=BUILD /opt/cuda /opt/cuda
COPY run.sh /
COPY install.sh /

ENTRYPOINT ["/run.sh"]
