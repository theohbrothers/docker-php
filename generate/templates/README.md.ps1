@"
# docker-php-fpm-alpine

[![github-actions](https://github.com/theohbrothers/docker-php-fpm-alpine/workflows/build/badge.svg)](https://github.com/theohbrothers/docker-php-fpm-alpine/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-php-fpm-alpine)](https://github.com/theohbrothers/docker-php-fpm-alpine/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-php-fpm-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-php-fpm-alpine)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-php-fpm-alpine/latest)](https://hub.docker.com/r/theohbrothers/docker-php-fpm-alpine)

Dockerized php with php extension(s), based on [official php images](https://hub.docker.com/_/php).

| Tags |
|:-------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` |

"@
    }else {
@"
| ``:$( $_['tag'] )`` |

"@
    }
}) -join ''
)
"@
