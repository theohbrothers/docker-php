FROM php:8.0.25-fpm-alpine3.15

# opcache
RUN set -eux; \
    docker-php-ext-install opcache

# mysqli (deprecated)
RUN set -eux; \
    docker-php-ext-install mysqli

# gd
RUN set -eux; \
    apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/; \
    docker-php-ext-install -j$(nproc) gd; \
    apk del freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-source delete

# PDO: mysql driver
RUN set -eux; \
    docker-php-ext-install pdo pdo_mysql

# PDO: pgsql driver
# See: https://github.com/docker-library/php/issues/221
RUN set -eux; \
    apk add --no-cache --virtual .pgsql-build-dependencies postgresql-dev; \
    docker-php-ext-install pdo pdo_pgsql; \
    apk del .pgsql-build-dependencies postgresql-dev

# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN set -eux; \
    apk add --no-cache libmemcached-libs zlib; \
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS; \
    apk add --no-cache --virtual .memcached-deps zlib-dev libmemcached-dev cyrus-sasl-dev; \
    pecl install memcached; \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini; \
    docker-php-source delete; \
    apk del .memcached-deps .phpize-deps; \
    df -h

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN set -eux; \
    docker-php-ext-install sockets

RUN set -eux; \
    echo; \
    php -i; \
    php -m
