go 自动部署
### 拉取后运行脚本
  go mod tidy -compat=1.21
  go build -o go-hayyachat-logger ./cmd/cron/main.go

### 传输选项：只复制执行文件 go-hayyachat-logger
  -rtv --include go-hayyachat-logger --exclude *

### 部署路径
  /www/wwwroot/testgo.hayyachat.logger/updatebin

### 部署后执行脚本 备份更新
  cd /www/wwwroot/testgo.hayyachat.logger
  daytime=`date '+%Y%m%d%H%M%S'`
  servername=go-hayyachat-logger
  bakbinfile="/www/wwwroot/testgo.hayyachat.logger/bakbin/"$servername"_"$daytime
  mv $servername $bakbinfile
  mv /www/wwwroot/testgo.hayyachat.logger/updatebin/$servername /www/wwwroot/testgo.hayyachat.logger/
  killall -15 $servername
  chmod a+x ./go-hayyachat-logger

  备注：依赖suporvisor 重启，因上面k掉没有启动

php部署
### 部署后执行脚本 
  chown -R www-data:www-data /var/www/html/laravel_tw.hayyachat.com
  rm -rf /var/www/html/laravel_tw.hayyachat.com/bootstrap/cache/*.php
  rm -rf /var/www/html/laravel_tw.hayyachat.com/storage/clockwork/17*.json
  cat /dev/null > /var/www/html/laravel_tw.hayyachat.com/storage/clockwork/index
  cat /dev/null > /var/www/html/laravel_tw.hayyachat.com/storage/logs/queue.log
  cat /dev/null > /var/www/html/laravel_tw.hayyachat.com/storage/logs/schedule.log
  supervisorctl reload
