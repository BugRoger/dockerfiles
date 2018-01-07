ARG NVIDIA_DRIVER_VERSION=384.111

FROM ubuntu

ENV BUILD_PACKAGES curl module-init-tools
ENV DRIVER_ARCHIVE=NVIDIA-Linux-x86_64-384.111
ENV SITE=us.download.nvidia.com/XFree86/Linux-x86_64

RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

RUN curl -v -L http://${SITE}/384.111/${DRIVER_ARCHIVE}.run -o /tmp/${DRIVER_ARCHIVE}.run
RUN sh /tmp/NVIDIA-Linux-x86_64-*run -s -N --no-kernel-module 
RUN rm -rf /tmp/*.run

RUN apt-get clean
RUN apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) 
RUN rm -rf /var/lib/apt/lists/*

