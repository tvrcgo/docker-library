#!/bin/sh

echo '--- certificate ---'
ls /etc/v2ray/key

v2ray run --config=/etc/v2ray/config.json
