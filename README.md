#docker BTsync

## Description:

This is a Dockerfile for "BitTorrent Sync" - (http://www.bittorrent.com/).
Specifically for use within an unRAID environment.

## Build from docker file:

```
git clone https://github.com/HurricaneHernandez/docker-btsync.git 
cd docker-btsync
docker build -t btsync . 
```

## Volumes:

#### `/config`

Configuration, state files for BitTorrent Sync. (i.e. /opt/appdata/btsync)

#### `/btsync`

Folder to be synced via BitTorrent Sync.  (i.e. /opt/downloads/btsync or /media/Tower/btsync or /mnt/user/btsync)


## Docker run command:

```
docker run -d --net=host -v /*your_config_location*:/config  -v /*your_sync_folder_location*:/btsync -v /etc/localtime:/etc/localtime:ro --name=btsync hurricane/docker-btsync
```
