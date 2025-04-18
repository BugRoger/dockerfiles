FROM ubuntu:16.04

ARG VERSION
ENV BUILD_PACKAGES curl unzip
WORKDIR /burstcoin
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES default-jre-headless
RUN curl -L "https://github.com/burst-team/burstcoin/releases/download/$VERSION/burstcoin-$VERSION.zip" -o burstcoin-$VERSION.zip
RUN unzip burstcoin-$VERSION.zip
RUN chmod +x run.sh
COPY html html
RUN rm burstcoin-$VERSION.zip
RUN apt-get clean
RUN apt-get remove --purge -y $BUILD_PACKAGES 
RUN rm -rf /var/lib/apt/lists/*

EXPOSE 8123 8125
ENTRYPOINT ["bash", "-c", "/burstcoin/run.sh"]
