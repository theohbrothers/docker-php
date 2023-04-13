FROM php:7.4.32-fpm-alpine3.16

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
    docker-php-ext-install pdo pdo_pgsql

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

# Xdebug: https://stackoverflow.com/questions/46825502/how-do-i-install-xdebug-on-dockers-official-php-fpm-alpine-image
# PHPIZE_DEPS: autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c
RUN set -eux; \
    apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS; \
    pecl install xdebug-2.9.8; \
    docker-php-ext-enable xdebug; \
    docker-php-source delete; \
    apk del .build-dependencies
RUN set -eux; \
    { \
        echo "[xdebug]"; \
        echo "zend_extension=xdebug"; \
        echo "xdebug.remote_enable=1"; \
        echo "xdebug.remote_host=host.docker.internal"; \
        echo "xdebug.remote_port=9000"; \
        echo "xdebug.remote_autostart=1"; \
        echo "xdebug.remote_connect_back=0"; \
    } > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;

RUN set -eux; \
    echo; \
    php -i; \
    php -m
