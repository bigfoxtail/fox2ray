#!/bin/sh
while [ ! -f "/config/certificates/CADDY_DOMAIN.crt" ];
do
    echo "Waiting for upcoming Server"
    sleep 2
done
echo "Start Server"
/usr/bin/xray -config /etc/xray/config.json
