FROM php:7.3.33-fpm-alpine

RUN apk add --no-cache ca-certificates

RUN set -eux; \
    echo; \
    php -i; \
    php -m
