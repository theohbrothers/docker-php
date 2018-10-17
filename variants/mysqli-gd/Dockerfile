FROM php:7.2-fpm-alpine

# mysqli (deprecated)
RUN docker-php-ext-install mysqli

# Cleanup
RUN rm -rf /usr/src/php \
    && rm -rf /var/cache/apk/*