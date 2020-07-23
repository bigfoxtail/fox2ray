#!/bin/sh
if [ ! -d "/docker_data/" ];then
  mkdir /docker_data
fi

sed -i "s/CADDY_DOMAIN/$CADDY_DOMAIN/" /etc/caddy/Caddyfile
sed -i "s/V2RAY_UUID/$V2RAY_UUID/" /etc/v2ray/config.json

caddy start --config /etc/caddy/Caddyfile --adapter caddyfile
v2ray -config=/etc/v2ray/config.json
