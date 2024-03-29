## lap docker说明
#### 1、docker 安装源 linux 系统在/etc/docker/daemon.json、win直接面板改

    {
        "registry-mirrors": [
            "https://cr.console.aliyun.com",        //阿里云
            "https://mirror.ccs.tencentyun.com",    //腾讯云
            "https://registry.docker-cn.com",       //Docker官方中国区
            "http://hub-mirror.c.163.com",          //网易
            "https://docker.mirrors.ustc.edu.cn"    //ustc
        ]
    }

#### 2、docker-compose包含一下软件    

    nginx:1.20

    php:5.6、7.0、7.1、7.2、7.3、7.4、8.0、8.1、8.2

    mysql:5.7、8

    rabbitmq:3.9.5-management

    redis:6.2.5

    mongo:4.2.16

    postgres:9.6.23

    elasticsearch:7.14.1

    kibana:7.14.1

    logstash:7.14.1
#### 3、把 `.env`设置变量
    
    跟目录项目、目录
    ENVIRONMENT=D:/environment/
    PROJECT_ROOT=www/

    PHP版本目录、端口
    PHP_VERSION = php8.1
    PHP_PORT = 9000

    mysql 版本目录、端口、密码
    MYSQL_VERSION = mysql8
    MYSQL_PORT = 3306
    MYSQL_ROOT_PASSWORD=123456
    
    nginx版本目录、端口
    NGINX_VERSION = nginx
    NGINX_PORT = 80

    redis 版本目录、端口
    REDIS_VERSION = redis
    REDIS_PORT = 6379

    mongo用户、密码、版本目录、端口
    MONGO_USER=root
    MONGO_PASSWORD=123456
    MONGO_VERSION=mongo
    MONGO_PORT=27017
    
    pgsql 版本目录、密码、端口
    POSTGRES_VERSION=postgres
    POSTGRES_PASSWORD=123456
    POSTGRES_PORT=5432
    
    rabbitmq 版本目录、用户、密码、http端口 tcp端口
    RABBITMQ_VERSION=rabbitmq
    RABBITMQ_USER=rabbitmq
    RABBITMQ_PASSWORD=123456
    RABBITMQ_PORT_ADMIN=15672
    RABBITMQ_PORT_PROGRAM=5672

    elk es目录、访问域名、版本目录、tcp端口、http端口、jvm内存、启动模式、集群名称
    ELK_DIRECTORY=elk/
    ELK_HOSTS = 127.0.0.1
    ELASTICSEARCH_VERSION=elasticsearch
    ELASTICSEARCH_PORT_TCP=9300
    ELASTICSEARCH_PORT_HTTP=9200
    ELASTICSEARCH_JAVA_OPTS=-Xms512m -Xmx512m
    ELASTICSEARCH_DISCOVERY_TYPE=single-node
    ELASTICSEARCH_CLUSTER_NAME=elasticsearch
    
    kibana 版本目录 端口
    KIBANA_VERSION=kibana
    KIBANA_PORT=5601
    
    logstash 版本目录、端口
    LOGSTASH_VERSION=logstash
    LOGSTASH_PORT=4560

#### 4、docker-compose 使用
    ** 如有pcll install 版本不适合，请到 http://pecl.php.net/ 查看版本
    构建docker-compose 全部
    docker-compose build

    构建单个
    docker-compose build xxx

    构建启动容器
    docker-compose up -d

    清除当前容器（数据也清除）
    docker-compose down

    查看容器日志 logs后加 -f 看时实
    docker-compose logs xxx

    查看运行实列
    docker-compose ps

    暂停指定服务
    docker-compose pause xxx

    重启
    docker-compose restart  xxx

    删除指定的服务的容器
    docker-compose rm xxx

    进入容器
    docker exec -it xxx bash

#### 5、ui界面

    rabbitmq
    http://127.0.0.1:15672/

    elasticsearch
    http://127.0.0.1:9200/

    kibana
    http://127.0.0.1:5601/app/home#/

#### protoc 编译器
    网盘下载protoc复制到/use/local/bin/protoc

#### 6、使用 supervisor 进程管理命令之前先启动 supervisord

    supervisord -c /etc/supervisor/supervisord.conf
    supervisorctl status        //查看所有进程的状态
    supervisorctl stop all      //停止
    supervisorctl start all     //启动
    supervisorctl restart       //重启
    supervisorctl update        //配置文件修改后使用该命令加载新的配置
    supervisorctl reload        //重新启动配置中的所有程序

    sudo supervisorctl start laravel-worker:*

## 7、windown docker 目录迁移

    1、首先关闭docker

    2、关闭所有发行版：
        wsl --shutdown

    3、将docker-desktop-data导出到D:\docker\docker-desktop-data.tar（注意，原有的docker images不会一起导出）
        wsl --export docker-desktop-data D:\docker\docker-desktop-data.tar

    4、注销docker-desktop-data：
        wsl --unregister docker-desktop-data

    5、重新导入docker-desktop-data到要存放的文件夹：D:\docker\:
        wsl --import docker-desktop-data D:\docker\ D:\docker\docker-desktop-data.tar


    wsl --shutdown
    wsl --export docker-desktop-data D:\docker\docker-desktop-data.tar
    wsl --unregister docker-desktop-data
    wsl --import docker-desktop-data D:\docker\ D:\docker\docker-desktop-data.tar

## 7、docker 代理
    "proxies": {
      "default": {
        "httpProxy": "127.0.0.1:7890",
        "httpsProxy": "127.0.0.1:7890"
      }
    }
