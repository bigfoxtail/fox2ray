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
V2RAY_UUID=69f9d2f3-89af-4d39-b80c-d4c0c7116086
Trojan_PORT=444
Trojan_PASSWORD1=ca95a6c31305
Trojan_PASSWORD2=ca95a6c31305

Trojan_CRTPATH=./server/caddy_data/caddy/certificates/acme-v02.api.letsencrypt.org-directory/$DOMAIN

sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/Caddyfile
sed -i "s/V2RAY_UUID/$V2RAY_UUID/" ./server/v2_config.json
Trojan_SSLCERT=/config/certificates/$DOMAIN.crt
Trojan_SSLKEY=/config/certificates/$DOMAIN.key
sed -i "s#/path/to/certificate.crt#$Trojan_SSLCERT#" ./server/trojan_server.json
sed -i "s#/path/to/private.key#$Trojan_SSLKEY#" ./server/trojan_server.json
sed -i "s/password1/$Trojan_PASSWORD1/" ./server/trojan_server.json
sed -i "s/password2/$Trojan_PASSWORD2/" ./server/trojan_server.json
sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/trojan_server.json
sed -i "s#Trojan_CRTPATH#$Trojan_CRTPATH#" docker-compose.yml
sed -i "s#Trojan_PORT#$Trojan_PORT#" docker-compose.yml
sed -i "s/CADDY_DOMAIN/$DOMAIN/" ./server/trojan_run.sh
