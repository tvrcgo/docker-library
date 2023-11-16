
FROM jellyfin/jellyfin

RUN set -eux; \
  sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories; \
  apk update; \
  # font
  apt install fonts-noto-cjk-extra; \
  # clear
  rm -f /root/.env; \
  rm -rf /root/.cache; \
  rm -rf /var/cache/apk/*
