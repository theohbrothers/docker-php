FROM php:7.2-fpm-alpine

# mysqli (deprecated)
RUN docker-php-ext-install -j$(nproc) mysqli \
    && docker-php-source delete

