#! /bin/sh

set -e

mkdir -p /config

if [ ! -f /config/btsync.conf ]; then
  cp /btsync.conf /config/btsync.conf
fi

/btsync --nodaemon --config /config/btsync.conf
