build
```bash
docker build -t wdj/usvn .
```

run 
```bash
docker run --restart=always -d \
-e NGROK_DOMAIN="domain" \
-v /data/domain-ssl:/ssl \
-p 80:80 \
-p 443:443 \
-p 4443:4443 \
--name container_name \
wdj/usvn
```