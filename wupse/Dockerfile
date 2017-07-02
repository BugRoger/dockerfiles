FROM alpine 
LABEL maintainer "Michael Schmidt <michael.j.schmidt@gmail.com>"

COPY *.sh /installer/
COPY etc /installer/etc
COPY opt /installer/opt

CMD ["/installer/run.sh"]
