This is a Dockerfile for "BitTorrent Sync" 

/config

Configuration, state files for BitTorrent Sync. (i.e. /opt/appdata/btsync)

docker run -d --net=host -v /path/to/config:/config  -v /etc/localtime:/etc/localtime:ro --name=btsync botez/docker-btsync
