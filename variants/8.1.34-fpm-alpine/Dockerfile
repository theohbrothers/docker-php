FROM php:8.1.34-fpm-alpine

RUN apk add --no-cache ca-certificates

RUN set -eux; \
    echo; \
    php -i; \
    php -m
