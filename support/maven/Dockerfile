#FROM ubuntu:latest
FROM dockerfile/java:latest

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_GB.utf8
RUN locale-gen en_US.utf8

ENV LANG en_GB.utf8
ENV LANGUAGE en_GB.utf8

RUN apt-get update

RUN apt-get install -y maven

RUN useradd -U -c "build user" -m go 
