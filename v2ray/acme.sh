#!/bin/sh

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

echo $DOMAIN, $MAIL, $DNS_AK

CERT_DIR=~/.acme.sh/${DOMAIN}_ecc
V2RAY_KEY_DIR=/etc/v2ray/key
mkdir -p $V2RAY_KEY_DIR

if [[ ! -f "$V2RAY_KEY_DIR/fullchain.cer" || ! -f "$V2RAY_KEY_DIR/private.key" ]]; then

  ~/.acme.sh/acme.sh --issue --dns $DNS_SVC -d $DOMAIN -d *.$DOMAIN -m $MAIL

  if [[ -f "$CERT_DIR/fullchain.cer" && -f "$CERT_DIR/$DOMAIN.key" ]]; then
    cp $CERT_DIR/fullchain.cer $V2RAY_KEY_DIR/fullchain.cer
    cp $CERT_DIR/$DOMAIN.key $V2RAY_KEY_DIR/private.key
  else
    echo "--- *.cer or *.key not exist ---"
    ls $CERT_DIR
    exit 1
  fi

fi
