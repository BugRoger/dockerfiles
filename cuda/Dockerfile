ARG NVIDIA_DRIVER_VERSION

FROM bugroger/nvidia:${NVIDIA_DRIVER_VERSION}

ENV BUILD_PACKAGES curl build-essential

RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

WORKDIR /tmp

# RUN curl -v -L "https://developer.nvidia.com/compute/cuda/8.0/Prod2/local_installers/cuda_8.0.61_375.26_linux-run" -o /tmp/cuda-run
COPY cuda_8.0.61_375.26_linux-run cuda-run
RUN chmod +x cuda-run 
RUN ./cuda-run -extract=/tmp/dest
RUN /tmp/dest/cuda-linux64-rel-8.0.61-21551265.run -noprompt
RUN rm -rf /tmp

RUN echo "/usr/local/cuda/lib64" >> /etc/ld.so.conf.d/cuda.conf 
RUN echo "/usr/local/nvidia/lib64" >> /etc/ld.so.conf.d/nvidia.conf
RUN ldconfig

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

RUN apt-get clean
RUN apt-get remove --purge -y $BUILD_PACKAGES $(apt-mark showauto) 
