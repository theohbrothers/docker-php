FROM php:8.3.37-fpm-alpine

# opcache
RUN set -eux; \
    docker-php-ext-install opcache; \
    php -m | grep -i opcache;

# mysqli (deprecated)
RUN set -eux; \
    docker-php-ext-install mysqli; \
    php -m | grep -i mysqli;

# gd
RUN set -eux; \
    apk add --no-cache freetype libjpeg-turbo libpng; \
    apk add --no-cache --virtual .deps freetype-dev libjpeg-turbo-dev libpng-dev; \
    docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/; \
    docker-php-ext-install gd; \
    php -m | grep -i gd; \
    docker-php-source delete; \
    apk del .deps

# PDO: mysql driver
RUN set -eux; \
    docker-php-ext-install pdo pdo_mysql; \
    php -m | grep -F PDO; \
    php -m | grep pdo_mysql;

# PDO: pgsql driver
# See: https://github.com/docker-library/php/issues/221
RUN set -eux; \
    apk add --no-cache postgresql-libs; \
    apk add --no-cache --virtual .deps postgresql-dev; \
    docker-php-ext-install pdo_pgsql; \
    php -m | grep -i pdo_pgsql; \
    apk del .deps

# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN set -eux; \
    apk add --no-cache libmemcached-libs zlib; \
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS; \
    apk add --no-cache --virtual .deps zlib-dev libmemcached-dev cyrus-sasl-dev; \
    pecl install memcached; \
    docker-php-ext-enable memcached; \
    php -m | grep -i memcached; \
    docker-php-source delete; \
    apk del .deps; \
    apk del .phpize-deps;

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN set -eux; \
    apk add --no-cache --virtual .deps linux-headers; \
    docker-php-ext-install sockets; \
    php -m | grep -i sockets; \
    apk del .deps

RUN set -eux; \
    echo; \
    php -i; \
    php -m
