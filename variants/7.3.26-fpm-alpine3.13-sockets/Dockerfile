FROM php:7.3.26-fpm-alpine3.13

# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN docker-php-ext-install sockets



RUN echo \
    && php -i \
    && php -m