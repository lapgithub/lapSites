
FROM ubuntu:18.04

# 版本有8.2、8.1、8.0、7.4、7.3、7.2、7.1、7.0、5.6、5.4、5.3、5.2
#PHP_VERSION_STRING=7.4
#PHP_DOCKER_IMAGE_NAME=php
#PHP_DOCKER_INSTALL_DIR=/usr/local/software/php/
#PHP_FILE_LINK=https://www.php.net/distributions/php



LABEL AUTHOR='lap';
ARG TIMETX=Asia/Shanghai

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list


RUN apt-get clean \
    && apt-get update \
    && apt-get upgrade -yqq \
    && apt-get install -y wget \
    pkg-config \
    gcc \
    libxml2-dev \
    libkrb5-dev \
    libssl-dev \
    libsqlite3-dev \
    libonig-dev \
    bzip2 \
    libbz2-dev \
    libcurl4-openssl-dev \
    libxslt-dev


WORKDIR /tem/install/


ARG GD_webp=--with-webp
ARG GD_jpeg=--with-jpeg
ARG GD_freetype=--with-freetype
#
ARG PHP_VERSION_STRING=5.5
ARG PHP_DOCKER_INSTALL_DIR=/usr/local/software/php/
ARG PHP_FILE_LINK=https://www.php.net/distributions/php

RUN wget ${PHP_FILE_LINK}-${PHP_VERSION_STRING}.0.tar.gz \
    && tar -zxvf php-${PHP_VERSION_STRING}.0.tar.gz \
    && cd php-${PHP_VERSION_STRING}.0 \
    && ./configure \
    --prefix=${PHP_DOCKER_INSTALL_DIR} \
    --with-config-file-path=${PHP_DOCKER_INSTALL_DIR}/php.ini \
    --with-config-file-scan-dir=${PHP_DOCKER_INSTALL_DIR}/etc/ \
    --enable-safe-mode \
    --enable-fpm \
    --enable-zip \
    --with-bz2 \
    --with-zlib \
    --with-libdir=lib64 \
    --with-webp \
    --with-jpeg \
    --with-freetype \
    --with-gd \
    --enable-bcmath \
    --with-gettext \
    --enable-inline-optimization \
    --enable-sockets \
    --enable-mbstring \
    --enable-sysvshm \
    --enable-sysvsem \
    --enable-sysvmsg \
    --with-mcrypt \
    --with-xsl \
    --with-pdo_mysql \
    --with-pdo-sqlite \
    --with-curl \
    --with-curlwrappers \
    --with-mysqli \
    --with-openssl \
    --with-mhash \
    --enable-exif \
    --enable-gd-native-ttf \
    --enable-shmop \
    --enable-soap \
    --enable-mysqlnd \
    --enable-mbregex \
     --with-kerberos \
    --enable-mbregex \
    --enable-opcache \
    --with-xmlrpc \
    --with-fpm-user=www-data \
    --with-fpm-group=www-data \
    && ln -s ${PHP_DOCKER_INSTALL_DIR}/sbin/* /usr/local/bin/ \
    && ln -s ${PHP_DOCKER_INSTALL_DIR}/bin/* /usr/local/bin/ \
    && groupadd www \
    && useradd -g www www \
    rm -rf /tmp/install


EXPOSE 9000
CMD ["php-fpm"]