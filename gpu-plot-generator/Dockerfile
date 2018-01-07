FROM bugroger/cuda:8.0.61_375.26

ARG VERSION

ENV BUILD_PACKAGES git cmake g++
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

WORKDIR /tmp
RUN git clone https://github.com/bhamon/gpuPlotGenerator.git

WORKDIR /tmp/gpuPlotGenerator

RUN git checkout -b $VERSION
ENV CUDA_PATH /usr/local/cuda-8.0
ENV OpenCL_LIBRARY /usr/local/cuda-8.0/lib64
RUN cmake .
RUN make

FROM ubuntu:16.04
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

COPY --from=0 /tmp/gpuPlotGenerator/gpuPlotGenerator /usr/local/bin/
COPY --from=0 /tmp/gpuPlotGenerator/kernel /usr/local/bin/kernel
COPY --from=0 /etc/OpenCL/vendors/nvidia.icd /etc/OpenCL/vendors/nvidia.icd

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

#ENTRYPOINT ["plot"]
