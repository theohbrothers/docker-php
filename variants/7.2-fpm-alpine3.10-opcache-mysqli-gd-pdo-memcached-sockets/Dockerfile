FROM php:7.2-fpm-alpine3.10

# opcache
RUN docker-php-ext-install opcache

# mysqli (deprecated)
RUN docker-php-ext-install mysqli

# gd
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apk del freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-source delete

# PDO: mysql driver
RUN docker-php-ext-install pdo pdo_mysql

# PDO: pgsql driver
# See: https://github.com/docker-library/php/issues/221
RUN apk add --no-cache --virtual .pgsql-build-dependencies postgresql-dev \
    && docker-php-ext-install pdo pdo_pgsql

# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN apk add --no-cache libmemcached-libs zlib \
    && apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache --virtual .memcached-deps zlib-dev libmemcached-dev cyrus-sasl-dev \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && docker-php-source delete \
    && apk del .memcached-deps .phpize-deps \
    && df -h

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN docker-php-ext-install sockets



