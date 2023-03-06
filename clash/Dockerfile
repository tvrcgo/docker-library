
FROM dreamacro/clash-premium:latest

COPY entrypoint.sh /entrypoint.sh
COPY root/* /root/
COPY init.d/* /etc/init.d/

RUN set -eux; \
    sed -i 's/dl-cdn.alpinelinux.org/mirrors.tuna.tsinghua.edu.cn/g' /etc/apk/repositories; \
    apk update; \
    apk add --no-cache \
        openrc \
    ;\
    #
    echo "Asia/Shanghai" > /etc/timezone; \
    chmod 755 /entrypoint.sh; \
    # add cron job
    cat /root/crontab.txt >> /var/spool/cron/crontabs/root; \
    # add clash service
    mkdir -p /run/clash; \
    mkdir -p /run/openrc; \
    touch /run/openrc/softlevel; \
    rc-update add clash; \
    # clean
    rm -rf /root/.cache; \
    rm -rf /var/cache/apk/*

ENTRYPOINT [ "/entrypoint.sh" ]
