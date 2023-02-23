
FROM dreamacro/clash-premium:latest

COPY entrypoint.sh /entrypoint.sh
COPY root/* /root/

RUN chmod 755 /entrypoint.sh; \
    cat /root/crontab.txt >> /var/spool/cron/crontabs/root;

ENTRYPOINT [ "/entrypoint.sh" ]
