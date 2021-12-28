# mjpg streamer 
FROM alpine:3.11.0 as mjpg-streamer
WORKDIR /mjpg-streamer
RUN apk --update --no-cache add curl openssl ca-certificates make cmake gcc g++ linux-headers jpeg-dev
RUN curl -sL https://github.com/jacksonliam/mjpg-streamer/archive/master.tar.gz | tar xvz --strip-components=2
RUN make

FROM  alpine:3.15.0 
RUN apk --update --no-cache add curl python3 py-pip openssl ca-certificates
WORKDIR /opt/octoprint
RUN curl -sL https://github.com/OctoPrint/OctoPrint/archive/refs/tags/1.7.2.tar.gz | tar xvz --strip-components=1
RUN apk --no-cache add --virtual build-dependencies python3-dev linux-headers build-base gcc   && pip install -r requirements.txt   && python3 setup.py install   && apk del build-dependencies

# Intall mjpp_streamer
COPY --from=mjpg-streamer /mjpg-streamer/_build/mjpg_streamer /usr/local/bin/mjpg_streamer
COPY --from=mjpg-streamer /mjpg-streamer/www /usr/local/share/mjpg_streamer/
COPY --from=mjpg-streamer /mjpg-streamer/*.so /usr/local/lib/
RUN apk --update --no-cache add jpeg-dev ffmpeg 

# Octolapse
WORKDIR /opt/octoprint/Octolapse
RUN curl -sL https://github.com/FormerLurker/Octolapse/archive/refs/tags/v0.4.1.tar.gz | tar xvz --strip-components=1
RUN apk --update --no-cache add --virtual build-dependencies python3-dev gcc linux-headers build-base zlib-dev && \
    pip install -r requirements.txt && \
    python3 setup.py install && \
    apk del build-dependencies 

# Firmware Updater
WORKDIR /opt/octoprint/OctoPrint-FirmwareUpdater
RUN curl -sL https://github.com/OctoPrint/OctoPrint-FirmwareUpdater/archive/refs/tags/1.13.0.tar.gz | tar xvz --strip-components=1
RUN apk --update --no-cache add avrdude
RUN apk --update --no-cache add --virtual build-dependencies python3-dev gcc linux-headers build-base && \
    pip install -r requirements.txt && \
    python3 setup.py install && \
    apk del build-dependencies 

# MeatPack
WORKDIR /opt/octoprint/OctoPrint-MeatPack
RUN curl -sL https://github.com/scottmudge/OctoPrint-MeatPack/archive/refs/tags/v1.5.21.tar.gz | tar xvz --strip-components=1
RUN apk --update --no-cache add --virtual build-dependencies python3-dev gcc linux-headers build-base && \
    pip install -r requirements.txt && \
    python3 setup.py install && \
    apk del build-dependencies 

# BedLevelVisualizer
WORKDIR /opt/octoprint/OctoPrint-BedLevelVisualizer
RUN curl -sL https://github.com/jneilliii/OctoPrint-BedLevelVisualizer/archive/refs/tags/1.1.0.tar.gz | tar xvz --strip-components=1
RUN apk --update --no-cache add --virtual build-dependencies python3-dev gcc linux-headers build-base && \
    pip install -r requirements.txt && \
    python3 setup.py install && \
    apk del build-dependencies 

CMD ["octoprint","serve","--iknowwhatimdoing"]
