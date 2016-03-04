FROM ubuntu:latest

WORKDIR /factorio

RUN apt-get update &&\
  apt-get install -y curl && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN curl -L -k https://www.factorio.com/get-download/0.12.25/headless/linux64 | tar -xzf -
VOLUME ["/factorio/factorio"]

EXPOSE 34197/udp

WORKDIR /factorio/factorio/bin/x64/
ENTRYPOINT ["./factorio"]
