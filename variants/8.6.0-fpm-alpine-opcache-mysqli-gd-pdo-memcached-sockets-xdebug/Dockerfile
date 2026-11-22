FROM php:8.6.0-fpm-alpine

# opcache
# Since php 8.5, opcache is already included by default. See: https://www.php.net/ChangeLog-8.php#8.5.0
RUN set -eux; \
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

# See: https://github.com/docker-library/php/issues/1554#issuecomment-3722916430
RUN --mount=type=bind,from=ghcr.io/php/pie:bin,source=/pie,target=/usr/local/bin/pie \
    set -eux; \
    apk add --no-cache libmemcached-libs zlib; \
    apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS libtool; \
    apk add --no-cache --virtual .deps zlib-dev libmemcached-dev cyrus-sasl-dev; \
    pie install php-memcached/php-memcached:dev-issue-8.6.0beta1; \
    php -m | grep -i memcached; \
    apk del .deps; \
    apk del .build-dependencies

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN set -eux; \
    apk add --no-cache --virtual .deps linux-headers; \
    docker-php-ext-install sockets; \
    php -m | grep -i sockets; \
    apk del .deps

# See: https://github.com/docker-library/php/issues/1554#issuecomment-3722916430
RUN --mount=type=bind,from=ghcr.io/php/pie:bin,source=/pie,target=/usr/local/bin/pie \
    set -eux; \
    apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS libtool; \
    apk add --no-cache --virtual .deps linux-headers; \
    pie install xdebug/xdebug:3.6.0alpha1; \
    php -m | grep xdebug; \
    apk del .deps; \
    apk del .build-dependencies

RUN set -eux; \
    echo; \
    php -i; \
    php -m
