FROM ubuntu

ARG VERSION

WORKDIR /tmp

ENV BUILD_PACKAGES curl libcurl3

RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES
RUN curl -L "https://github.com/nanopool/Claymore-Dual-Miner/releases/download/v${VERSION}/Claymore.s.Dual.Ethereum.Decred_Siacoin_Lbry_Pascal.AMD.NVIDIA.GPU.Miner.v${VERSION}.-.LINUX.tar.gz" -o cdm.tar.gz
RUN mkdir /claymore-dual-miner
RUN tar xzf cdm.tar.gz -C /claymore-dual-miner
RUN rm -rf /tmp/*
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* 

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

ENTRYPOINT ["/claymore-dual-miner/ethdcrminer64"]
