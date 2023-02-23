#!/bin/sh

# update clash config file
sh /root/update-clash-config.sh

# start crond
/usr/sbin/crond

# start clash
openrc
rc-service clash start

# pending process
while [[ true ]]; do
  sleep 1
done
