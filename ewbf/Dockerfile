FROM ubuntu:16.04

ARG VERSION

WORKDIR /tmp

COPY ${VERSION}.tar.gz .
RUN tar xzf ${VERSION}.tar.gz
RUN cp ${VERSION}/miner /usr/local/bin/miner
RUN rm -rf /tmp/*

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

ENTRYPOINT ["/usr/local/bin/miner"]
CMD ["-h"]
