## 复制文件到服务器 
    scp —P22 /usr/local/nginx/conf/* root@127.0.0.1:/usr/local/nginx/conf

## mysql 导出导入
    mysqldump -h127.0.0.1 -P3306 -uroot -p123456 test > test.sql
    登录mysql: source /usr/local/test.sql

## 文件操作
    文件test.log的开头十行
    head -n 10 test.log

    文件test.log的尾部十行
    tail -n 10 test.log

    根据关键词搜索如 文件为：test.log, 关键词为：product.ERROR
    cat -n test.log |grep "product.ERROR"

    根据时间查看日志区间
    grep '16:2[3-9]' access.log
    
    可以向前向后access.log内容，并在屏幕底部显示已显示内容的百分比,空格下一屏、回车下一行。U上半屏、Y上一行，[PageDown]下翻一页，[PageUp]上翻一页，Q退出less命令
    less -m access.log

    替换、修改文件内容
    sed 's/原内容/新内容/g' 文件路径及名称

## 权限
    修改文件拥有组
    chgrp 用户组 文件名

    修改文件拥有者
    chown 用户组 文件名

    修改文件权限
    chmod -R 777 ./logs

## linux
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
