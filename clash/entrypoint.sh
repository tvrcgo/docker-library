#!/bin/sh

# update clash config file
sh /root/update-clash-config.sh

# start crond
/usr/sbin/crond

# start clash
openrc
rc-service clash start

# pending process
tail -f /dev/null
