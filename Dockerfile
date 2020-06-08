FROM php:7.2-fpm

# 自定义参数在docker-compose.yml中使用
ARG user
ARG uid

# 更新系统包安装系统依赖
RUN  sed -i s@/security.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN  sed -i s@/deb.debian.org/@/mirrors.aliyun.com/@g /etc/apt/sources.list
RUN apt-get clean
RUN apt-get update && apt-get install -y \
    git \
    curl \
    libpng-dev \
    libonig-dev \
    libxml2-dev \
#    libjpeg62-turbo-dev \
#    libfreetype6-dev \
#    locales \
    zip \
    unzip

# 清除系统缓存
RUN apt-get clean && rm -rf /var/lib/apt/lists/*

# 安装php扩展及配置
RUN docker-php-ext-install pdo_mysql mbstring exif pcntl bcmath gd zip
#RUN docker-php-ext-configure  --with-freetype-dir=/usr/include/ --with-jpeg-dir=/usr/include/ --with-png-dir=/usr/include/

# 获取composer安装包
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# 创建系统用户去执行composer命令与artisan 命令
RUN useradd -G www-data,root -u $uid -d /home/$user $user
RUN mkdir -p /home/$user/.composer && \
    chown -R $user:$user /home/$user

# Set working directory
WORKDIR /var/www

USER $user
