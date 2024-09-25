## 安装 
#### 拉取镜像
    docker pull nsqio/nsq
    成功提示
        What's next:
        View a summary of image vulnerabilities and recommendations → docker scout quickview nsqio/nsq
#### 运行 lookupd
    docker run --name lookupd -p 4160:4160 -p 4161:4161 -d nsqio/nsq /nsqlookupd
    说明:
        -p 是映射端口
        -d 是后台运行容器
        /nsqlookupd 就是启动命令

#### 运行 nsqd
    docker run --name nsqd -p 4150:4150 -p 4151:4151 -d nsqio/nsq /nsqd --broadcast-address=10.0.2.15 --lookupd-tcp-address=10.0.2.15:4160 --data-path=/data
    说明:
        --10.0.2.15 为ip4本机地址
        --broadcast-address=10.0.2.15 是广播地址
        --lookupd-tcp-address=10.0.2.15:4160 是 lookupd 地址
        --data-path=/data 是数据存储路径

#### 运行 nsqadmin
    docker run -d --name nsqadmin -p 4171:4171 nsqio/nsq /nsqadmin --lookupd-http-address=10.0.2.15:4161
    说明:
        --10.0.2.15 为ip4本机地址
        --lookupd-http-address=10.0.2.15:4161 是 lookupd 地址

#### 运行生产者
    curl -d 'hello world ' 'http://127.0.0.1:4151/pub?topic=test'

    说明:
        -e NSQD_HTTP_ADDRESS=127.0.0.1:4151 是 nsqd 地址
        -topic=test 是 topic 名称
        -message="hello world" 是消息内容

#### 查看生产信息
    http://10.0.2.15:4161/topics

##  描述
    访问 http://10.0.2.15:4161 就可以查看 nsq系统详情了
    http接口
    提供了 各种http接口供调用，详情参考官网，这里仅做个别测试
    /nodes :显示集群节点信息
    /info ：显示版本信息
    /ping ：验证服务状态
    /topics：显示所有的topic
    /channel/create:创建channel
    /channel/delete:删除channel
    /topic/create:创建topic
    /topic/delete:删除topic
    /lookup ：查找指定topic 的生产者
