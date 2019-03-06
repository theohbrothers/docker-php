FROM php:7.2-fpm-alpine

# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN MEMCACHED_DEPS zlib-dev libmemcached-dev cyrus-sasl-dev \
    && apk add --no-cache --update libmemcached-libs zlib \
    && apk add --no-cache --update --virtual .phpize-deps $PHPIZE_DEPS \
    && apk add --no-cache --update --virtual .memcached-deps $MEMCACHED_DEPS \
    && pecl install memcached \
    && echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini \
    && docker-php-source delete \
    && apk del .memcached-deps .phpize-deps \
    && df -h

