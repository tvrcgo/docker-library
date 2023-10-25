#!/bin/sh

source /root/.env

MAIL="admin@$DOMAIN"

echo "DNS Provider: $DNS_SVC"
echo "Domain: $DOMAIN <$MAIL>"

~/.acme.sh/acme.sh --issue --dns $DNS_SVC -d $DOMAIN -d *.$DOMAIN -m $MAIL

CERT_DIR=~/.acme.sh/${DOMAIN}_ecc
ls $CERT_DIR

PUBLIC_KEY="$CERT_DIR/fullchain.cer"
PRIVATE_KEY="$CERT_DIR/$DOMAIN.key"

if [[ -f "$PUBLIC_KEY" && -f "$PRIVATE_KEY" ]]; then
  SAVE_DIR=~/ssl_keys/${DOMAIN}/$(date '+%Y%m%d')
  mkdir -p $SAVE_DIR
  cp -rf $CERT_DIR/* $SAVE_DIR
else
  echo "FAILED: fullchain.cer or $DOMAIN.key not exist"
  exit 1
fi
