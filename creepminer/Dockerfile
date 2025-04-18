FROM bugroger/cuda:8.0.61_375.26

ENV BUILD_PACKAGES git wget build-essential libssl-dev 
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

WORKDIR /tmp
RUN apt-get install -y wget
RUN wget https://pocoproject.org/releases/poco-1.7.8/poco-1.7.8p3-all.tar.gz
RUN tar -xzvf poco-1.7.8p3-all.tar.gz
WORKDIR /tmp/poco-1.7.8p3-all
RUN ./configure --no-tests --no-samples --omit=Data/ODBC,Data/MySQL
RUN make 
RUN ldconfig 
RUN make install 


RUN git clone https://github.com/Creepsky/creepMiner.git /tmp/creepMiner
WORKDIR /tmp/creepMiner
RUN git checkout 2.8.0
RUN apt-get install -y cmake python python-pip 
RUN pip install conan 
RUN conan install --build=missing -s compiler.libcxx=libstdc++11
RUN cmake CMakeLists.txt -DCMAKE_BUILD_TYPE=RELEASE -DLOG_OUTPUT=Terminal
RUN make
RUN chmod +x bin/run.sh

FROM ubuntu:16.04
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

RUN apt-get update 
RUN apt-get install -y libssl1.0.0
RUN rm -rf /tmp/*
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/* 

COPY --from=0 /root/.conan/data/Poco/1.8.0.1/pocoproject/stable/package/f527cbe7f3ed93e59c291a0246492ccf6fc31d07/lib/libPoco* /usr/local/lib/
COPY --from=0 /tmp/creepMiner/bin /creepMiner

ENV PATH $PATH:/usr/local/nvidia/bin:/usr/local/cuda/bin
ENV LD_LIBRARY_PATH $LD_LIBRARY_PATH:/usr/local/nvidia/lib64/:/usr/local/cuda/lib64/

EXPOSE 8080

WORKDIR /creepMiner

ENTRYPOINT ["/creepMiner/run.sh"]
