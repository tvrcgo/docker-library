
FROM v2fly/v2fly-core

COPY config.json /etc/v2ray/config.json
COPY acme.sh /root/acme.sh
COPY .env /root/.env
COPY entrypoint.sh /entrypoint.sh

RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
    apk update; \
    # install libs
    apk add --no-cache \
      curl \
      socat \
    ;\
    # generate certification
    sh /root/acme.sh; \
    # clear
    rm -f /root/.env; \
    rm -rf /root/.cache; \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
