# 请更改IMAGE_NAME为下面版本
# php:5.6-fpm、
# php:7.0-fpm、 php:7.1-fpm、 php:7.2-fpm、 php:7.3-fpm、 php:7.4-fpm、
# php:8.0-fpm、 php:8.1-fpm、 php:8.2-fpm
FROM php:7.4-fpm

LABEL AUTHOR='lap';
ARG PHP_DOCKER_VERSION=73

RUN if [ ${PHP_DOCKER_VERSION} < 74 ];  then \
    sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list \
       && sed -i "s@http://deb.debian.org@http://mirrors.aliyun.com@g" /etc/apt/sources.list.d/buster.list; \
fi

RUN if [ ${PHP_DOCKER_VERSION} < 74 ]; then \
      apt-get update && \
      apt-get install -yqq \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libmcrypt-dev \
        libpng-dev; \
      docker-php-ext-configure gd \
      --with-webp=/usr/include/webp \
      --with-jpeg=/usr/include/ \
      --with-freetype=/usr/include/freetype2; \
      docker-php-ext-install gd; \
  else \
      apt-get update && \
      apt-get install -yqq \
        zlib1g-dev \
        libpng-dev \
        libwebp-dev \
        libjpeg-dev \
        libfreetype6-dev \
		pkg-config; \
      docker-php-ext-configure gd \
      --with-webp=/usr/include/webp \
      --with-jpeg=/usr/include \
      --with-freetype=/usr/include; \
     docker-php-ext-install gd; \
fi



#### 服务器相关工具
############################## cron #################################
ARG CRONTAB_INSTALL=false
RUN if [ ${CRONTAB_INSTALL} = true ];  then \
     apt-get install -y cron; \
fi

############################## supervisor #################################
ARG SUPERVISOR_INSTALL=false
RUN if [ ${SUPERVISOR_INSTALL} = true ];  then \
     apt-get install -y supervisor; \
fi

############################## openssl #################################
ARG SSH_CLIENT_INSTALL=false
RUN if [ ${SSH_CLIENT_INSTALL} = true ];  then \
     apt-get install -y libcurl4-openssl-dev \
     libssl-dev; \
fi

############################## openssh-server #################################
ARG SSH_SERVER_INSTALL=false
RUN if [ ${SSH_SERVER_INSTALL} = true ];  then \
     apt-get install -y openssh-server; \
fi

############################## vim #################################
ARG VIM_INSTALL=false
RUN if [ ${VIM_INSTALL} = true ];  then \
     apt-get install -y vim; \
fi

############################## procps #################################
ARG PROCPS_INSTALL=false
RUN if [ ${PROCPS_INSTALL} = true ];  then \
     apt-get install -y procps; \
fi

############################## wget #################################
ARG WGET_INSTALL=false
RUN if [ ${WGET_INSTALL} = true ];  then \
     apt-get install -y wget; \
fi




## php扩展
############################## sockets #################################
ARG SOCKETS_INSTALL=false
RUN if [ ${SOCKETS_INSTALL} = true ];  then \
     docker-php-ext-install sockets; \
fi

############################## bcmath #################################
ARG BCMATH_INSTALL=false
RUN if [ ${BCMATH_INSTALL} = true ];  then \
     docker-php-ext-install bcmath; \
fi

############################## sysvsem #################################
ARG SYSVSEM_INSTALL=false
RUN if [ ${SYSVSEM_INSTALL} = true ];  then \
     docker-php-ext-install sysvsem; \
fi

############################## pcntl #################################
ARG PCNTL_INSTALL=false
RUN if [ ${PCNTL_INSTALL} = true ];  then \
     docker-php-ext-install pcntl; \
fi

############################## opcache #################################
ARG OPCACHE_INSTALL=false
RUN if [ ${OPCACHE_INSTALL} = true ];  then \
     docker-php-ext-install opcache; \
fi

############################## pdo_mysql #################################
ARG PDO_MYSQL_INSTALL=false
RUN if [ ${PDO_MYSQL_INSTALL} = true ];  then \
     docker-php-ext-install pdo_mysql; \
fi

############################## pdo #################################
ARG PDO_INSTALL=false
RUN if [ ${PDO_INSTALL} = true ];  then \
     docker-php-ext-install pdo; \
fi

############################## mysqli #################################
ARG MYSQLI_INSTALL=false
RUN if [ ${MYSQLI_INSTALL} = true ];  then \
     docker-php-ext-install mysqli; \
fi



############################## redis #################################
ARG REDIS_INSTALL=false
RUN if [ ${REDIS_INSTALL} = true ]; then \
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl install -o -f redis-4.3.0; \
    else \
      pecl install -o -f redis; \
    fi \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable redis \
;fi

############################## MongoDB #################################
ARG MONGODB_INSTALL=false
RUN if [ ${MONGODB_INSTALL} = true ]; then \
    # Install the mongodb extension
    if [ $(php -r "echo PHP_MAJOR_VERSION;") = "5" ]; then \
      pecl install mongo; \
      docker-php-ext-enable mongo; \
      php -m | grep -oiE '^mongo$'; \
    else \
      if [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ] && { [ $(php -r "echo PHP_MINOR_VERSION;") = "0" ] || [ $(php -r "echo PHP_MINOR_VERSION;") = "1" ] ;}; then \
        pecl install mongodb-1.9.2; \
      else \
        pecl install mongodb; \
      fi; \
      docker-php-ext-enable mongodb; \
      php -m | grep -oiE '^mongodb$'; \
    fi; \
fi

############################## swoole ################################# 需要调整
ARG SWOOLE_INSTALL=false
RUN if [ ${SWOOLE_INSTALL} = true ]; then \
  if   [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "50600" ]; then \
    pecl install swoole-2.0.10; \
  elif [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70000" ]; then \
    pecl install swoole-4.3.5; \
  elif [ $(php -r "echo PHP_VERSION_ID - PHP_RELEASE_VERSION;") = "70100" ]; then \
    pecl install swoole-4.5.11; \
  elif [ $(php -r "echo PHP_MAJOR_VERSION;") = "7" ]; then \
    pecl install swoole-4.8.12; \
  else \
    pecl install swoole; \
  fi; \
  docker-php-ext-enable swoole; \
  php -m | grep -q 'swoole'; \
fi

############################## 文件安装 rabbitmq #################################
ARG RABBITMQ_INSTALL=false
RUN if [ ${RABBITMQ_INSTALL} = true ]; then \
      apt-get -yqq install librabbitmq-dev; \
      if [ ${PHP_DOCKER_VERSION} -ge 80]; then \
        pecl install amqp-1.11.0beta; \
      else \
        pecl install amqp; \
      fi; \
      docker-php-ext-enable amqp; \
      php -m | grep -oiE '^amqp$'; \
fi

############################## 文件安装 exif #################################
ARG EXIF_INSTALL=false
RUN if [ ${EXIF_INSTALL} = true ]; then \
    docker-php-ext-install exif; \
fi


############################## 文件安装 intl #################################
ARG INTL_INSTALL=false
RUN if [ ${INTL_INSTALL} = true ]; then \
    apt-get install -yqq zlib1g-dev libicu-dev g++ && \
    docker-php-ext-configure intl && \
    docker-php-ext-install intl \
;fi

############################## postgresql #################################

ARG PGSQL_INSTALL=false
RUN if [ ${PGSQL_INSTALL} = true ]; then \
    apt-get install -yqq gnupg \
    && . /etc/os-release \
    && echo "deb http://apt.postgresql.org/pub/repos/apt $VERSION_CODENAME-pgdg main" > /etc/apt/sources.list.d/pgdg.list \
    && curl -sL https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
    && apt-get update -yqq \
    && apt-get install -yqq postgresql-client-${PG_CLIENT_VERSION} postgis; \
    if [ ${INSTALL_POSTGIS} = true ]; then \
      apt-get install -yqq postgis; \
    fi \
    && apt-get purge -yqq gnupg \
;fi


############################## composer #################################
ARG COMPOSER_INSTALL=false
RUN if [ ${COMPOSER_INSTALL} = true ];  then \
    curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer \
         	&& composer config -g repo.packagist composer https://packagist.phpcomposer.com; \
fi

############################## zip ################################# 待调整
#ARG ZIP_INSTALL=false
#RUN if [ ${ZIP_INSTALL} = true ];  then \
#    apt-get install --no-install-recommends -yqq wget \
#    # Install Oracle Instantclient
#      && mkdir /opt/oracle \
#      && cd /opt/oracle \
#      && wget https://github.com/the-paulus/oracle-instantclient/raw/master/instantclient-basic-linux.x86_64-18_3.zip \
#      && wget https://github.com/the-paulus/oracle-instantclient/raw/master/instantclient-sdk-linux.x86_64-18_3.zip \
#      && unzip /opt/oracle/instantclient-basic-linux.x86_64-18_3.zip -d /opt/oracle \
#      && unzip /opt/oracle/instantclient-sdk-linux.x86_64-18_3.zip -d /opt/oracle \
#      && rm -rf /opt/oracle/*.zip; \
#      docker-php-ext-install zip; \
#fi

WORKDIR /www/
