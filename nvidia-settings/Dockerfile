FROM bugroger/nvidia:381.22 

RUN apt-get update
RUN apt-get install -y xorg xserver-xorg-video-dummy xserver-xorg-input-void libgtk-3-common

COPY etc /etc

CMD ["startx"]
