# fox2ray


### 使用官方镜像集成，结构简洁，可随时跟随官方进行更新。

### 使用说明：

caddy版本默认使用2.3，在本地进行构建。

端口80默认由caddy使用，提供证书和伪装服务；443由xray使用，提供数据传输和回落伪装。

caddy启动后自动申请证书；提供XTLS+VLESS和WS+VMess两种连接方式，WS+VMess连接路径为`/line`。

运行使用的主要配置文件保存在`server`文件夹下。

需要安装docker和docker-compose。

修改`fox2ray.properties`文件中的参数，运行`./init.sh`进行配置文件初始化。

使用命令`./fox2ray.sh`启动相关服务。

默认屏蔽国内网站
