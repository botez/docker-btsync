FROM aostanin/ubuntu

ADD http://download-lb.utorrent.com/endpoint/btsync/os/linux-glibc23-x64/track/stable /btsync.tar.gz
RUN tar xvzf /btsync.tar.gz && rm /btsync.tar.gz

ADD start.sh /start.sh
ADD btsync.conf /btsync.conf

VOLUME ["/config"]
VOLUME ["/sync"]
EXPOSE 3369
EXPOSE 3369/udp
EXPOSE 8888

CMD ["/start.sh"]
