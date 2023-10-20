
FROM alpine:3

COPY acme.sh /root/acme.sh
COPY .env /root/.env

RUN set -eux; \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
  apk update; \
  # install libs
  apk add --no-cache \
    curl \
    socat \
    openssl \
    tzdata \
  ;\
  # clear
  rm -rf /root/.cache; \
  rm -rf /var/cache/apk/*

ENTRYPOINT [ "sh", "/root/acme.sh" ]
