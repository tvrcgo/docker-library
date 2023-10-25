#!/bin/sh

source /root/.env
curl https://get.acme.sh | sh;

echo $DOMAIN, $DNS_SVC
MAIL="admin@$DOMAIN"

~/.acme.sh/acme.sh --issue --dns $DNS_SVC -d $DOMAIN -d *.$DOMAIN -m $MAIL

CERT_DIR=~/.acme.sh/${DOMAIN}_ecc
V2RAY_KEY_DIR=/etc/v2ray/key
mkdir -p $V2RAY_KEY_DIR

if [[ -f "$CERT_DIR/fullchain.cer" && -f "$CERT_DIR/$DOMAIN.key" ]]; then
  cp -f $CERT_DIR/fullchain.cer $V2RAY_KEY_DIR/fullchain.cer
  cp -f $CERT_DIR/$DOMAIN.key $V2RAY_KEY_DIR/private.key
else
  echo "--- *.cer or *.key not exist ---"
  ls $CERT_DIR
  exit 1
fi
