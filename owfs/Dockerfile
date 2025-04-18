FROM ubuntu:16.04

RUN apt-get update 
RUN apt-get install -y owfs

COPY owfs.conf /etc/owfs.conf

RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*
