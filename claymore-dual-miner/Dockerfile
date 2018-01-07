FROM ubuntu:16.04

ARG VERSION

WORKDIR /tmp
RUN mkdir /claymore-dual-miner
COPY cdm.$VERSION.tar.gz .
RUN tar xzf cdm.$VERSION.tar.gz -C /claymore-dual-miner --strip=1
RUN rm -rf /tmp/*

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

ENTRYPOINT ["/claymore-dual-miner/ethdcrminer64"]
