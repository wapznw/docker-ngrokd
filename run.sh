#!/bin/sh

if [ x"$NGROK_DOMAIN" = "x" ];then
NGROK_DOMAIN="ngrokd.wendaojiang.com"
fi
if [ x"$NGROK_HTTP_ADDR" = "x" ];then
NGROK_HTTP_ADDR=":80"
fi
if [ x"$NGROK_HTTPS_ADDR" = "x" ];then
NGROK_HTTPS_ADDR=":443"
fi
if [ x"$NGROK_TUNNEL_ADDR" = "x" ];then
NGROK_TUNNEL_ADDR=":4443"
fi

ngrokd -tlsKey="/ssl/domain-ssl.key" \
-tlsCrt="/ssl/domain-ssl.crt" \
-domain="$NGROK_DOMAIN" \
-httpAddr="$NGROK_HTTP_ADDR" \
-httpsAddr="$NGROK_HTTPS_ADDR" \
-tunnelAddr="$NGROK_TUNNEL_ADDR"
