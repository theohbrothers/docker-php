@"
# docker-php

[![github-actions](https://github.com/theohbrothers/docker-php/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-php/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-php)](https://github.com/theohbrothers/docker-php/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)

Dockerized php with php extension(s), based on [official php images](https://hub.docker.com/_/php).

## Tags

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
$(
($VARIANTS | % {
    if ( $_['tag_as_latest'] ) {
@"
| ``:$( $_['tag'] )``, ``:latest`` | [View](variants/$( $_['tag'] ) ) |

"@
    }else {
@"
| ``:$( $_['tag'] )`` | [View](variants/$( $_['tag'] ) ) |

"@
    }
}) -join ''
)
"@
