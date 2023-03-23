
FROM node:16-alpine

WORKDIR /app

COPY app/* /app/

RUN set -eux; \
    npm install --omit=dev; \
    npm install pm2 -g;

CMD pm2-runtime /app/server.js
