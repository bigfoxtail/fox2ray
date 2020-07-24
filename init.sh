#!/bin/sh
if [ ! -d "./server/caddy_data" ];then
  mkdir -p ./server/caddy_data
fi
cp v2_config.json ./server/v2_config.json
cp Caddyfile ./server/Caddyfile

CADDY_DOMAIN=www.test.com
V2RAY_UUID=69f9d2f3-89af-4d39-b80c-d4c0c7116086

sed -i "s/CADDY_DOMAIN/$CADDY_DOMAIN/" ./server/Caddyfile
sed -i "s/V2RAY_UUID/$V2RAY_UUID/" ./server/v2_config.json
