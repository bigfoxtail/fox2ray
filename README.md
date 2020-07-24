# fox2ray


#### 使用官方镜像集成，结构简洁，可随时跟随官方进行更新。

#### 使用说明：

端口80，443默认由caddy使用；trojan未配置共用端口，默认使用444。

caddy启动后自动申请证书；V2ray连接路径为`/line`。

运行使用的主要配置文件保存在`server`文件夹下。

安装docker和docker-compose。

修改`fox2ray.properties`文件中的参数，运行`./init.sh`进行配置文件初始化。

使用命令`sudo docker-compose up -d`启动相关服务。
