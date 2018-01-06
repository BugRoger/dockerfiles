FROM ubuntu:16.04

ENV BUILD_PACKAGES git wget build-essential libssl-dev 
RUN apt-get update 
RUN apt-get install -y $BUILD_PACKAGES

WORKDIR /tmp
RUN git clone https://github.com/Creepsky/creepMiner.git

RUN apt-get install -y wget
RUN wget https://pocoproject.org/releases/poco-1.7.6/poco-1.7.6-all.tar.gz
RUN tar -xzvf poco-1.7.6-all.tar.gz
WORKDIR /tmp/poco-1.7.6-all
RUN ./configure --no-tests --no-samples 
RUN make 
RUN ldconfig 
RUN make install 

WORKDIR /tmp/creepMiner
RUN git checkout development
RUN apt-get install -y cmake
RUN cmake CMakeLists.txt -DCMAKE_BUILD_TYPE=RELEASE -DLOG_OUTPUT=Terminal -DCPU_INSTRUCTION_SET=AVX2
RUN make
RUN chmod +x bin/run.sh
RUN cp bin/creepMiner-avx2 bin/creepMiner
RUN cp -R /tmp/creepMiner/bin /creepMiner
RUN rm -rf /tmp

EXPOSE 8080

WORKDIR /creepMiner

ENTRYPOINT ["/creepMiner/run.sh"]
