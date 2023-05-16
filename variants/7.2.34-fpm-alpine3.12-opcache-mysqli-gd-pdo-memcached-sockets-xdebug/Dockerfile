FROM php:7.2.34-fpm-alpine3.12

# opcache
RUN set -eux; \
    docker-php-ext-install opcache

# mysqli (deprecated)
RUN set -eux; \
    docker-php-ext-install mysqli

# gd
RUN set -eux; \
    apk add --no-cache freetype libjpeg-turbo libpng; \
    apk add --no-cache --virtual .deps freetype-dev libjpeg-turbo-dev libpng-dev; \
    docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install gd; \
    docker-php-source delete; \
    apk del .deps

# PDO: mysql driver
RUN set -eux; \
    docker-php-ext-install pdo pdo_mysql

# PDO: pgsql driver
# See: https://github.com/docker-library/php/issues/221
RUN set -eux; \
    apk add --no-cache postgresql-libs; \
    apk add --no-cache --virtual .deps postgresql-dev; \
    docker-php-ext-install pdo_pgsql; \
    apk del .deps

# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN set -eux; \
    apk add --no-cache libmemcached-libs zlib; \
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS; \
    apk add --no-cache --virtual .deps zlib-dev libmemcached-dev cyrus-sasl-dev; \
    pecl install memcached; \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini; \
    docker-php-source delete; \
    apk del .deps; \
    apk del .phpize-deps;

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN set -eux; \
    apk add --no-cache --virtual .deps linux-headers; \
    docker-php-ext-install sockets; \
    apk del .deps

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
