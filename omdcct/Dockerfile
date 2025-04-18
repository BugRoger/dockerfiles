FROM ubuntu:16.04

ENV BUILD_PACKAGES git make gcc
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

WORKDIR /tmp
RUN git clone https://github.com/alter3d/omdcct

WORKDIR /tmp/omdcct
RUN make

FROM ubuntu:16.04
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

COPY --from=0 /tmp/omdcct/plot /usr/local/bin/plot
COPY --from=0 /tmp/omdcct/plotavx2 /usr/local/bin/plotavx2

ENTRYPOINT ["plot"]
