FROM ubuntu:16.04

RUN apt-get update
RUN apt-get install -y xorg xserver-xorg-video-dummy xserver-xorg-input-void libgtk-3-common

COPY etc /etc

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin


CMD ["startx"]
