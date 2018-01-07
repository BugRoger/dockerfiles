FROM ubuntu:16.04

ARG VERSION

WORKDIR /tmp
COPY zm_$VERSION.tar.gz .
RUN tar xzf zm_$VERSION.tar.gz --strip=1
RUN cp zm /usr/local/bin
RUN rm -rf /tmp/*

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/
