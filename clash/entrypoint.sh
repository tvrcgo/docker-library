#!/bin/sh

# update clash config file
sh /root/update-clash-config.sh

# start crond
/usr/sbin/crond

# start clash
/clash -d /root/config
