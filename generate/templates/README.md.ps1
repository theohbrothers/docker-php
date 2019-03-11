@"
# docker-php-fpm-alpine

[![pipeline status](https://gitlab.com/leojonathanoh/docker-php-fpm-alpine/badges/dev/pipeline.svg)](https://gitlab.com/leojonathanoh/docker-php-fpm-alpine/commits/dev)

Official php:7.2-fpm-alpine with php extension(s).

# Variants

Each variant includes the one or more php extensions.

| Tags |
|:-------:| $( $VARIANTS | % {
"`n| ``:$( $_['tag'] )`` |"
})
"@