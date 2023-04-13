@"
FROM php:$( $VARIANT['_metadata']['base_image_tag'] )


"@

$VARIANT['_metadata']['components'] | % {
    $component = $_

    switch( $component ) {

        'gd' {
            # Fix for php 7.4
            # See: https://github.com/docker-library/php/issues/931#issuecomment-568658449 and https://github.com/docker-library/php/issues/912#issuecomment-559918036
            if ( $VARIANT['tag'] -match '^8.0|^7.4') {
                @'
# gd
RUN set -eux; \
    apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-ext-configure gd \
        --with-freetype=/usr/include/ \
        --with-jpeg=/usr/include/; \
    docker-php-ext-install -j$(nproc) gd; \
    apk del freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-source delete


'@
            }else {
                @'
# gd
RUN set -eux; \
    apk add --no-cache freetype libpng libjpeg-turbo freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-ext-configure gd \
        --with-gd \
        --with-freetype-dir=/usr/include/ \
        --with-png-dir=/usr/include/ \
        --with-jpeg-dir=/usr/include/; \
    docker-php-ext-install -j$(nproc) gd; \
    apk del freetype-dev libpng-dev libjpeg-turbo-dev; \
    docker-php-source delete


'@
            }
        }

        'memcached' {
            @'
# memcached
# See: https://stackoverflow.com/questions/40894385/how-can-i-install-the-php-memcached-extension-on-dockers-php7-alpine-image
RUN set -eux; \
    apk add --no-cache libmemcached-libs zlib; \
    apk add --no-cache --virtual .phpize-deps $PHPIZE_DEPS; \
    apk add --no-cache --virtual .memcached-deps zlib-dev libmemcached-dev cyrus-sasl-dev; \
    pecl install memcached; \
    echo "extension=memcached.so" > /usr/local/etc/php/conf.d/20_memcached.ini; \
    docker-php-source delete; \
    apk del .memcached-deps .phpize-deps; \
    df -h


'@

        }

        'mysqli' {
            @'
# mysqli (deprecated)
RUN set -eux; \
    docker-php-ext-install mysqli


'@
        }

        'opcache' {
            @'
# opcache
RUN set -eux; \
    docker-php-ext-install opcache


'@
        }

        'pdo' {
            @'
# PDO: mysql driver
RUN set -eux; \
    docker-php-ext-install pdo pdo_mysql

# PDO: pgsql driver
# See: https://github.com/docker-library/php/issues/221
RUN set -eux; \
    apk add --no-cache postgresql-libs; \
    apk add --no-cache --virtual .pgsql-build-dependencies postgresql-dev; \
    docker-php-ext-install pdo pdo_pgsql; \
    apk del .pgsql-build-dependencies postgresql-dev


'@
        }

        'sockets' {
            @'
# Sockets
# See: https://github.com/docker-library/php/issues/181#issuecomment-173365852
RUN set -eux; \
    docker-php-ext-install sockets


'@

        }

        'xdebug' {
            if ( $VARIANT['tag'] -match '^8.0') {
                # Install xdebug v3 for php >= v8
                @'
# Xdebug: https://stackoverflow.com/questions/46825502/how-do-i-install-xdebug-on-dockers-official-php-fpm-alpine-image
# PHPIZE_DEPS: autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c
RUN set -eux; \
    apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS; \
    pecl install xdebug-3.1.5; \
    docker-php-ext-enable xdebug; \
    docker-php-source delete; \
    apk del .build-dependencies
RUN set -eux; \
    { \
        echo "[xdebug]"; \
        echo "zend_extension=xdebug"; \
        echo "xdebug.mode=debug"; \
        echo "xdebug.start_with_request=yes"; \
        echo "xdebug.client_host=host.docker.internal"; \
        echo "xdebug.client_port=9000"; \
    } > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;


'@
            }else {
                # Install xdebug v2 for php < v8
                @'
# Xdebug: https://stackoverflow.com/questions/46825502/how-do-i-install-xdebug-on-dockers-official-php-fpm-alpine-image
# PHPIZE_DEPS: autoconf dpkg-dev dpkg file g++ gcc libc-dev make pkgconf re2c
RUN set -eux; \
    apk add --no-cache --virtual .build-dependencies $PHPIZE_DEPS; \
    pecl install xdebug-2.9.8; \
    docker-php-ext-enable xdebug; \
    docker-php-source delete; \
    apk del .build-dependencies
RUN set -eux; \
    { \
        echo "[xdebug]"; \
        echo "zend_extension=xdebug"; \
        echo "xdebug.remote_enable=1"; \
        echo "xdebug.remote_host=host.docker.internal"; \
        echo "xdebug.remote_port=9000"; \
        echo "xdebug.remote_autostart=1"; \
        echo "xdebug.remote_connect_back=0"; \
    } > /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini;


'@
            }
        }

        default {
            throw "No such component: $component"
        }
    }
}

@"
RUN set -eux; \
    echo; \
    php -i; \
    php -m

"@
