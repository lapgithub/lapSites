FROM php:7.3-fpm

LABEL AUTHOR='lap';

RUN sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list

RUN apt-get update && \
    apt-get install -yqq \
    wget \
    zlib1g-dev  \
    libicu-dev \
    pkg-config \
    libfreetype6-dev \
    libmcrypt-dev \
    libpng-dev \
    libwebp-dev \
    libjpeg-dev

# php扩展
RUN pecl install mcrypt  \
    && docker-php-ext-enable mcrypt \
    && docker-php-ext-configure gd  \
    --with-webp-dir=/usr/include/webp  \
    --with-jpeg-dir=/usr/include/  \
    --with-freetype-dir=/usr/include/freetype2 \
    && docker-php-ext-install gd \
    && docker-php-ext-configure intl \
    && docker-php-ext-install bcmath \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install gettext

############################## sockets(消息通讯)#################################
ARG INSTALL_EXTEND_SOCKETS=false
RUN if [ ${INSTALL_EXTEND_SOCKETS} = true ];  then \
     docker-php-ext-install sockets; \
fi

############################## sysvsem(进程间信号量) #################################
ARG INSTALL_EXTEND_SYSVSEM=false
RUN if [ ${INSTALL_EXTEND_SYSVSEM} = true ];  then \
     docker-php-ext-install sysvsem; \
fi

############################## pcntl(多进程扩展) #################################
ARG INSTALL_EXTEND_PCNTL=false
RUN if [ ${INSTALL_EXTEND_PCNTL} = true ];  then \
     docker-php-ext-install pcntl; \
fi

############################## opcache(性能扩展) #################################
ARG INSTALL_EXTEND_OPCACHE=false
RUN if [ ${INSTALL_EXTEND_OPCACHE} = true ];  then \
     docker-php-ext-install opcache; \
fi

############################## exif(编译扩展工具) #################################
ARG INSTALL_EXTEND_EXIF=false
RUN if [ ${INSTALL_EXTEND_EXIF} = true ]; then \
    docker-php-ext-install exif; \
fi

############################## 文件安装 intl #################################
ARG INSTALL_EXTEND_INTL=false
RUN if [ ${INSTALL_EXTEND_INTL} = true ]; then \
    docker-php-ext-install intl; \
fi


# pecl 安装
############################## redis #################################
ARG INSTALL_EXTEND_REDIS=false
RUN if [ ${INSTALL_EXTEND_REDIS} = true ];  then \
    pecl install -o -f redis\
    && docker-php-ext-enable redis; \
fi

############################## swoole #################################
ARG INSTALL_EXTEND_SWOOLE=false
RUN if [ ${INSTALL_EXTEND_SWOOLE} = true ];  then \
    pecl install swoole-4.8.12 \
    && docker-php-ext-enable swoole; \
fi

############################## mongodb #################################
ARG INSTALL_EXTEND_MONGODB=false
RUN if [ ${INSTALL_EXTEND_MONGODB} = true ];  then \
    pecl install mongodb \
    && docker-php-ext-enable mongodb; \
fi

############################## 文件安装 rabbitmq #################################
ARG INSTALL_EXTEND_RABBITMQ=false
RUN if [ ${INSTALL_EXTEND_RABBITMQ} = true ];  then \
    apt-get -y install librabbitmq-dev \
    && pecl install amqp \
    && docker-php-ext-enable amqp; \
fi


WORKDIR /tmp/
############################## 文件安装 zip #################################
ARG INSTALL_EXTEND_ZIP=false
RUN if [ ${INSTALL_EXTEND_ZIP} = true ];  then \
    wget https://hqidi.com/big/libzip-1.2.0.tar.gz \
    && tar -zxvf libzip-1.2.0.tar.gz \
    && cd libzip-1.2.0 \
    && ./configure \
    && make && make install \
    && docker-php-ext-install zip \
    && rm -rf /tmp/libzip-1.2.0 tmp/libzip-1.2.0.tar.gz; \
fi

############################## 文件安装 pgsql #################################
ARG INSTALL_EXTEND_PGSQL=false
RUN if [ ${INSTALL_EXTEND_PGSQL} = true ];  then \
    apt-get install -y --on-install-recommends libpq-dev  \
    && rm -r /var/lib/apt/lists/*  \
    && docker-php-ext-install -j$(nproc) pgsql pdo_pgsql; \
fi

WORKDIR /www/
############################### composer #################################
ARG INSTALL_EXTEND_COMPOSER=false
RUN if [ ${INSTALL_EXTEND_COMPOSER} = true ];  then \
    php -r "copy('https://install.phpcomposer.com/installer', 'composer-setup.php');" \
    && php composer-setup.php \
    && php -r "unlink('composer-setup.php');" \
    && mv composer.phar /usr/local/bin/composer \
    && composer config -g repo.packagist composer https://mirrors.aliyun.com/composer/; \
fi
