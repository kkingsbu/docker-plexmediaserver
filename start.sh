#!/bin/bash

# Erase possible stale .pid file
rm -f "/volume/config/Library/Application Support/Plex Media Server/plexmediaserver.pid"

# Start PMS
/usr/sbin/start_pms
