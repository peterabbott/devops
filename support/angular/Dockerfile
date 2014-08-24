FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_GB.utf8
RUN locale-gen en_US.utf8

ENV LANG en_GB.utf8
ENV LANGUAGE en_GB.utf8

RUN sudo apt-get install -y python git ruby-full rubygems npm 
RUN sudo gem install sass compass

RUN npm install -g yo generator-angular

