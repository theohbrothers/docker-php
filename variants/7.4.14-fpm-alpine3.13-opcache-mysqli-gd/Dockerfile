FROM php:7.4.14-fpm-alpine3.13

# opcache
RUN docker-php-ext-install opcache

# mysqli (deprecated)
RUN docker-php-ext-install mysqli

# gd
RUN apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apk del freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-source delete



