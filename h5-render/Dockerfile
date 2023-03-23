
FROM node:16-alpine

WORKDIR /app

COPY package.json /app/
COPY server.js /app/

RUN set -eux; \
    npm install --omit=dev; \
    npm install pm2 -g;

CMD pm2-runtime /app/server.js
