# Builds a docker image for btsync
FROM ubuntu:trusty
MAINTAINER Carlos Hernandez <carlos@techbyte.ca>

# Let the container know that there is no tty
ENV DEBIAN_FRONTEND noninteractive

# Set user nobody to uid and gid of unRAID
RUN usermod -u 99 nobody
RUN usermod -g 100 nobody

# Set locale
ENV LANGUAGE en_US.UTF-8
ENV LANG en_US.UTF-8
RUN locale-gen en_US en_US.UTF-8
RUN update-locale LANG=en_US.UTF-8
RUN dpkg-reconfigure locales

# Update Ubuntu
RUN apt-get -q update
RUN apt-mark hold initscripts udev plymouth mountall
RUN apt-get -qy --force-yes dist-upgrade

ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-glibc23-x64/track/stable /btsync.tar.gz
RUN mkdir btsync && tar xvzf /btsync.tar.gz -C /btsync && rm /btsync.tar.gz
RUN chown -R nobody:users /btsync

ADD start.sh /start.sh
ADD btsync.conf /btsync.conf

VOLUME ["/config"]
VOLUME ["/btsync"]
EXPOSE 3369
EXPOSE 3369/udp
EXPOSE 8888

USER nobody
CMD ["/start.sh"]
