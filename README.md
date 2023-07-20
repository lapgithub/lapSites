## lap docker说明
#### 1、本docker-compose包含一下软件

    nginx:1.20

    php:7.3.5-fpm、php:7.4-fpm、php:8.1.0-fpm

    mysql:5.7、mysql:8

    rabbitmq:3.9.5-management

    redis:6.2.5

    mongo:4.2.16

    postgres:9.6.23

    elasticsearch:7.14.1

    kibana:7.14.1

    logstash:7.14.1
#### 2、把 `.env`设置变量
    
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

#### 3、docker-compose 使用
    ** 如有pcll install 版本不适合，请到 http://pecl.php.net/ 查看版本
    构建
    docker-compose build xxx

    后台运行（首次构建）
    docker-compose up -d

    查看运行实列
    docker-compose ps

    重启
    docker-compose restart

    关闭
    docker-compose down

    进入容器
    docker exec -it xxx bash

#### ui界面

    rabbitmq
    http://127.0.0.1:15672/

    elasticsearch
    http://127.0.0.1:9200/

    kibana
    http://127.0.0.1:5601/app/home#/

#### 使用 supervisor 进程管理命令之前先启动 supervisord

    supervisord -c /etc/supervisor/supervisord.conf
    supervisorctl status        //查看所有进程的状态
    supervisorctl stop all      //停止
    supervisorctl start all     //启动
    supervisorctl restart       //重启
    supervisorctl update        //配置文件修改后使用该命令加载新的配置
    supervisorctl reload        //重新启动配置中的所有程序

    sudo supervisorctl start laravel-worker:*

## docker 目录迁移

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

## linux常用操作命令
    文件test.log的开头十行
    head -n 10 test.log

    文件test.log的尾部十行
    head -n 10 test.log

    根据关键词搜索如 文件为：test.log, 关键词为：product.ERROR
    cat -n test.log |grep "product.ERROR"

    根据时间查看日志区间
    grep '16:2[3-9]' access.log
    
    可以向前向后access.log内容，并在屏幕底部显示已显示内容的百分比,空格下一屏、回车下一行。U上半屏、Y上一行，[PageDown]下翻一页，[PageUp]上翻一页，Q退出less命令
    less -m access.log

    
    ps aux|grep {php}
    ps -ef|grep {php}
    
    查看占用cpu 最多的进程
    ps H -eo pid,pcpu | sort -nk2 |tail
    
    查看占用cpu 最多的进程 方法二
    top
    shift + t

    查看pid归属
    ps aux|fgrep {pid}

    查看端口连接情况
    netstat -lap | fgrep {22}

    修改文件拥有组
    chgrp 用户组 文件名

    修改文件拥有者
    chown 用户组 文件名

    修改文件权限
    chmod -R 777 ./logs
