#!/bin/sh

Color_Text()
{
  echo -e " \e[0;$2m$1\e[0m"
}

Echo_Red()
{
  echo $(Color_Text "$1" "31")
}

Echo_Green()
{
  echo $(Color_Text "$1" "32")
}

Echo_Yellow()
{
  echo $(Color_Text "$1" "33")
}

Echo_Blue()
{
  echo $(Color_Text "$1" "34")
}

Echo_Green 'check netwrok'
docker network ls | grep fox2ray_default > /dev/null
if [ $? -ne 0 ]; then
        Echo_Green 'create netwrok'
        docker network create fox2ray_default
fi
Echo_Green 'check container'
docker ps | grep ztncui > /dev/null
if [ $? -eq 0 ]; then
        Echo_Green 'rm ztncui'
        docker stop ztncui
        docker rm -f ztncui
fi
Echo_Green 'pull image'
docker pull keynetworks/ztncui
Echo_Green 'run container'

cur_path=$(cd `dirname $0`;pwd)
docker run -d --name ztncui \
    --restart=always \
    -p 9993:9993 \
    -p 9993:9993/udp \
    -p 4000:4000 \
    -e HTTP_PORT=4000 \
    -e HTTP_ALL_INTERFACES=yes \
    -e ZTNCUI_PASSWD=1234567890! \
    -v ${cur_path}/ztncui_etc:/opt/key-networks/ztncui/etc \
    -v ${cur_path}/ztncui_zt1:/var/lib/zerotier-one \
    keynetworks/ztncui
Echo_Green 'join netwrok'
docker network connect fox2ray_default ztncui
Echo_Green 'completed'
Echo_Green 'default password: 1234567890!'
