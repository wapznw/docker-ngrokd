#!/bin/sh
NGROK_DOMAIN=*.wendaojiang.com
openssl genrsa -out rootCA.key 2048
openssl req -x509 -new -nodes -key rootCA.key -subj "/CN=$NGROK_DOMAIN" -days 5000 -out rootCA.pem
openssl genrsa -out domain-ssl.key 2048
openssl req -new -key domain-ssl.key -subj "/CN=$NGROK_DOMAIN" -out domain-ssl.csr
openssl x509 -req -in domain-ssl.csr -CA rootCA.pem -CAkey rootCA.key -CAcreateserial -out domain-ssl.crt -days 5000
