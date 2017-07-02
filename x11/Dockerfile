ARG NVIDIA_DRIVER_VERSION

FROM bugroger/nvidia:${NVIDIA_DRIVER_VERSION}

RUN apt-get update
RUN apt-get install -y xorg xserver-xorg-video-dummy xserver-xorg-input-void libgtk-3-common

COPY etc /etc

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

CMD ["startx"]
