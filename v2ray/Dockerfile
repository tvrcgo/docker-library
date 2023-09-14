
FROM v2fly/v2fly-core

COPY config.json /etc/v2ray/config.json
COPY acme.sh /root/acme.sh
COPY entrypoint.sh /entrypoint.sh

ARG DNS_SVC
ARG DNS_AK
ARG DNS_SK
ARG DOMAIN
ARG MAIL

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
    rm -rf /root/.cache; \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "sh", "/entrypoint.sh" ]
