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

docker run --restart=always -d \
-e NGROK_DOMAIN="domain" \
-v /data/domain-ssl:/ssl \
-p 80:80 \
-p 443:443 \
-p 4443:4443 \
--name container_name \
wdj/usvn

