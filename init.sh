#!/bin/sh
if [ ! -d "./server/caddy_data" ];then
  mkdir -p ./server/caddy_data
fi
cp docker-compose-template.yml docker-compose.yml
cp trojan_server.json ./server/trojan_server.json
cp v2_config.json ./server/v2_config.json
cp Caddyfile ./server/Caddyfile
cp trojan_run.sh ./server/trojan_run.sh

DOMAIN=www.test.com
V2RAY_UUID=e7ccee8e-a760-40cb-bb48-ef9f4666918d
Trojan_PASSWORD=ef9f4666918d
Trojan_PORT=444
if [ -f ./fox2ray.properties ]; then
    . ./fox2ray.properties
fi

Trojan_CRTPATH=./server/caddy_data/caddy/certificates/acme-v02.api.letsencrypt.org-directory/$DOMAIN

sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/Caddyfile
sed -i "s/V2RAY_UUID/$V2RAY_UUID/" ./server/v2_config.json
Trojan_SSLCERT=/config/certificates/$DOMAIN.crt
Trojan_SSLKEY=/config/certificates/$DOMAIN.key
sed -i "s#/path/to/certificate.crt#$Trojan_SSLCERT#" ./server/trojan_server.json
sed -i "s#/path/to/private.key#$Trojan_SSLKEY#" ./server/trojan_server.json
sed -i "s/password[0-9]/$Trojan_PASSWORD/" ./server/trojan_server.json
sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/trojan_server.json
sed -i "s#Trojan_CRTPATH#$Trojan_CRTPATH#" docker-compose.yml
sed -i "s#Trojan_PORT#$Trojan_PORT#" docker-compose.yml
sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/trojan_run.sh
