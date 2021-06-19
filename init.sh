#!/bin/sh
if [ ! -d "./server/caddy_data" ];then
  mkdir -p ./server/caddy_data
fi
cp ./template/docker-compose-template.yml ./server/docker-compose.yml
cp ./template/xray_server.json ./server/xray_server.json
cp ./template/Caddyfile ./server/Caddyfile
cp ./template/xray_run.sh ./server/xray_run.sh
cp -r ./template/caddy-docker ./server/caddy-docker
cp -r ./template/site ./server/site

DOMAIN=www.test.com
Xray_UUID=e7ccee8e-a760-40cb-bb48-ef9f4666918d
if [ -f ./fox2ray.properties ]; then
    . ./fox2ray.properties
fi

Xray_CERTPATH=./caddy_data/caddy/certificates/

sed -i "s/CADDY_DOMAIN/$DOMAIN/g" ./server/Caddyfile
sed -i "s/Xray_UUID/$Xray_UUID/g" ./server/xray_server.json
#Xray_SSLCERT=/config/certificates/$DOMAIN.crt
#Xray_SSLKEY=/config/certificates/$DOMAIN.key
#sed -i "s#/path/to/certificate.crt#$Xray_SSLCERT#" ./server/xray_server.json
#sed -i "s#/path/to/private.key#$Xray_SSLKEY#" ./server/xray_server.json
sed -i "s#Xray_CERTPATH#$Xray_CERTPATH#" ./server/docker-compose.yml
sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/xray_run.sh
