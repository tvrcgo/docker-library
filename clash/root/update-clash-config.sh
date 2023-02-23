#!/bin/sh

CONFIG_FILE="/root/config/config.yaml"

if [[ ! -e $CONFIG_URL ]]; then
  echo "Local config file = $CONFIG_FILE"
  echo "Config file URL = $CONFIG_URL, start updating ...";
  rm -f $CONFIG_FILE;
  wget -O $CONFIG_FILE $CONFIG_URL;
fi
