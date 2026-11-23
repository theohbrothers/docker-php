FROM php:8.4.28-fpm-alpine

RUN apk add --no-cache ca-certificates

RUN set -eux; \
    echo; \
    php -i; \
    php -m
