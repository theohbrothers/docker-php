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



