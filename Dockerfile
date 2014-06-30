# Builds a docker image for btsync
FROM phusion/baseimage:0.9.11
MAINTAINER botez <troyolson1@gmail.com>
ENV DEBIAN_FRONTEND noninteractive

# Set correct environment variables
ENV HOME /root

# Use baseimage-docker's init system
CMD ["/sbin/my_init"]

# Fix a Debianism of the nobody's uid being 65534
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

RUN apt-get update -q

# install dependencies for madsonic
RUN apt-get install -qy curl
RUN apt-get clean

RUN curl -o /usr/bin/btsync.tar.gz http://download-lb.utorrent.com/endpoint/btsync/os/linux-x64/track/stable
RUN cd /usr/bin && tar -xzvf btsync.tar.gz && rm btsync.tar.gz
RUN mkdir -p /btsync/.sync

ADD btsync.conf /btsync.conf

EXPOSE 8888
EXPOSE 55555

VOLUME /config

RUN mkdir /etc/service/btsync
ADD btsync.sh /etc/service/btsync/run
RUN chmod +x /etc/service/btsync/run
