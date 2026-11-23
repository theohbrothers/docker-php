FROM php:8.0.30-fpm-alpine

RUN apk add --no-cache ca-certificates

RUN set -eux; \
    echo; \
    php -i; \
    php -m
