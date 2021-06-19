#!/bin/sh
name=CADDY_DOMAIN.crt
while [ 1 ]
do
    for domain in `find /config/certificates -name $name`
    do
        if [ -n "$domain" ]; then
            crtpath=$domain
            keypath=${crtpath/.crt/.key}
            echo "1${crtpath}"
            echo "2${keypath}"
            rm /etc/xray/startconfig.json
            cp /etc/xray/config.json /etc/xray/startconfig.json
            sed -i "s#/path/to/certificate.crt#$crtpath#" /etc/xray/startconfig.json
            sed -i "s#/path/to/private.key#$keypath#" /etc/xray/startconfig.json
            echo "Start Server"
            /usr/bin/xray -config /etc/xray/startconfig.json
            exit 0
        fi
    done
echo "等待3秒"
sleep 3
done