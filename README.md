# fox2ray


使用命令`mkdir -p /home/docker_data`创建该docker的数据存储文件夹，申请完成的HTTPS证书将存放在这里

使用`uuidgen`生成UUID

使用UUID替换命令中V2RAY_UUID的值

使用自己的域名替换命令中CADDY_DOMAIN的值

执行以下命令
```
sudo docker run -d -p 80:80 -p 443:443 -p 10001:10001 \
--env V2RAY_UUID=69f9d2f3-89af-4d39-b80c-d4c0c7116086 \
--env CADDY_DOMAIN=www.test.com \
--name=fox2ray --restart=always \
-v /home/docker_data:/docker_data \
bigfoxtail/fox2ray
```

## 集成caddy和V2ray，实际上并不会方便多少，故不在更新。