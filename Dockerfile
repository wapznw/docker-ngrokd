FROM busybox

RUN mkdir /ssl
COPY ngrokd /bin/ngrokd
COPY domain-ssl.crt /ssl/domain-ssl.crt
COPY domain-ssl.key /ssl/domain-ssl.key
COPY run.sh /run.sh
RUN chmod +x /run.sh && chmod +x /bin/ngrokd

ENV NGROK_DOMAIN ngork.wendaojiang.com

VOLUME /data

EXPOSE 80
EXPOSE 443
EXPOSE 4443
CMD ["sh", "/run.sh"]

