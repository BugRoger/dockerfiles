FROM bugroger/cuda:8.0.61_375.26

ARG VERSION

ENV BUILD_PACKAGES git libcurl4-openssl-dev libssl-dev libjansson-dev automake autotools-dev build-essential
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

RUN git clone https://github.com/tpruvot/ccminer.git /tmp

WORKDIR /tmp
RUN git checkout -b $VERSION
RUN ./autogen.sh
RUN ./configure.sh
RUN make -j 4


FROM ubuntu:16.04

ENV RUNTIME_PACKAGES libcurl4-openssl-dev libssl-dev libjansson-dev libgomp1
RUN apt-get update && \
    apt-get install -y $RUNTIME_PACKAGES && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

COPY --from=0 /tmp/ccminer /usr/local/bin/ccminer

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

ENTRYPOINT ["ccminer"]

