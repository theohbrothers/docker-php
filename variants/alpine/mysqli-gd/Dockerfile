FROM php:7.2-fpm-alpine

# mysqli (deprecated)
RUN docker-php-ext-install -j$(nproc) mysqli && \
    && rm -rf /usr/src/php \
    && rm -rf /var/cache/apk/*

# gd
RUN apk update \
    && apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev \
    && docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/ \
    && docker-php-ext-install -j$(nproc) gd \
    && apk del --no-cache freetype-dev libpng-dev libjpeg-turbo-dev \
    && rm -rf /usr/src/php \
    && rm -rf /var/cache/apk/*

