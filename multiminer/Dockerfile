FROM bugroger/dstm:0.5.8 as dstm
FROM bugroger/ewbf:0.3.4b as ewbf 
FROM bugroger/claymore-dual-miner:v10.2 as cdm
FROM bugroger/ccminer:2.2.4-tpruvot as ccminer

FROM ubuntu:16.04

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/


ENV RUNTIME_PACKAGES wget
ENV CCMINER_RUNTIME_PACKAGES libcurl4-openssl-dev libssl-dev libjansson-dev libgomp1

RUN apt-get update && \
    apt-get install -y $RUNTIME_PACKAGES $CCMINER_RUNTIME_PACKAGES && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* 

RUN wget -O /usr/local/bin/dumb-init https://github.com/Yelp/dumb-init/releases/download/v1.2.1/dumb-init_1.2.1_amd64
RUN chmod +x /usr/local/bin/dumb-init

COPY --from=dstm    /usr/local/bin/zm      /usr/local/bin/
COPY --from=ewbf    /usr/local/bin/miner   /usr/local/bin/
COPY --from=ccminer /usr/local/bin/ccminer /usr/local/bin
COPY --from=cdm     /claymore-dual-miner   /claymore-dual-miner

COPY ethdcrminer64 /usr/local/bin
COPY miningpoolhub /usr/local/bin

ENTRYPOINT ["/usr/local/bin/dumb-init", "--"]
