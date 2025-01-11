
FROM nginx:alpine

COPY nginx.conf /etc/nginx/nginx.conf
COPY cert /etc/nginx/cert

RUN set -eux; \
  # timezone
  echo "Asia/Shanghai" > /etc/timezone; \
  # clean
  rm -rf /root/.cache; \
  rm -rf /var/cache/apk/*

ENV TZ=Asia/Shanghai
