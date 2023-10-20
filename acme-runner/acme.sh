#!/bin/sh

source /root/.env
curl https://get.acme.sh | sh;

case $DNS_SVC in
  dns_gd)
    export GD_Key="$DNS_AK"
    export GD_Secret="$DNS_SK"
    ;;
  dns_ali)
    export Ali_Key="$DNS_AK"
    export Ali_Secret="$DNS_SK"
    ;;
  dns_dp)
    export DP_Id="$DNS_AK"
    export DP_Key="$DNS_SK"
    ;;
  *) ;;
esac

MAIL="admin@$DOMAIN"

echo "DNS Provider: $DNS_SVC"
echo "Domain: $DOMAIN <$MAIL>"

~/.acme.sh/acme.sh --issue --dns $DNS_SVC -d $DOMAIN -d *.$DOMAIN -m $MAIL

CERT_DIR=~/.acme.sh/${DOMAIN}_ecc
SAVE_DIR=~/ssl_keys/${DOMAIN}
ls $CERT_DIR

PUBLIC_KEY="$CERT_DIR/fullchain.cer"
PRIVATE_KEY="$CERT_DIR/$DOMAIN.key"

if [[ -f "$PUBLIC_KEY" && -f "$PRIVATE_KEY" ]]; then
  mkdir -p $SAVE_DIR
  SUFFIX=$(date '+%Y%m%d%H%M')
  cp $PUBLIC_KEY $SAVE_DIR/fullchain_$SUFFIX.cer
  cp $PRIVATE_KEY $SAVE_DIR/private_$SUFFIX.key
else
  echo "FAILED: *.cer or *.key not exist"
  exit 1
fi
