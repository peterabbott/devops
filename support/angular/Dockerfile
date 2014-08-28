FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN locale-gen en_GB.utf8
RUN locale-gen en_US.utf8

ENV LANG en_GB.utf8
ENV LANGUAGE en_GB.utf8

RUN sudo apt-get update
RUN sudo apt-get install -y python git ruby1.9.3 npm
RUN sudo apt-get install -y nodejs nodejs-legacy

RUN gem install sass compass
RUN npm install -g grunt-cli
RUN npm install -g bower 

ADD ./run.sh /usr/local/bin/run.sh
RUN chmod 0755 /usr/local/bin/run.sh

#ENTRYPOINT  /usr/local/bin/run.sh
