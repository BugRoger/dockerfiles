FROM bugroger/nvidia:384.111

RUN apt-get update && \
    apt-get install -y xorg xserver-xorg-video-dummy xserver-xorg-input-void libgtk-3-common && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

COPY etc /etc

CMD ["startx"]
