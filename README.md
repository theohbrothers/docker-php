# docker-php

[![github-actions](https://github.com/theohbrothers/docker-php/workflows/ci-master-pr/badge.svg)](https://github.com/theohbrothers/docker-php/actions)
[![github-tag](https://img.shields.io/github/tag/theohbrothers/docker-php)](https://github.com/theohbrothers/docker-php/releases/)
[![docker-image-size](https://img.shields.io/microbadger/image-size/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)
[![docker-image-layers](https://img.shields.io/microbadger/layers/theohbrothers/docker-php/latest)](https://hub.docker.com/r/theohbrothers/docker-php)

Dockerized php with php extension(s), based on [official php images](https://hub.docker.com/_/php).

| Tag | Dockerfile Build Context |
|:-------:|:---------:|
| `:7.2.34-fpm-alpine3.12-opcache` | [View](variants/7.2.34-fpm-alpine3.12-opcache ) |
| `:7.2.34-fpm-alpine3.12-mysqli` | [View](variants/7.2.34-fpm-alpine3.12-mysqli ) |
| `:7.2.34-fpm-alpine3.12-gd` | [View](variants/7.2.34-fpm-alpine3.12-gd ) |
| `:7.2.34-fpm-alpine3.12-pdo` | [View](variants/7.2.34-fpm-alpine3.12-pdo ) |
| `:7.2.34-fpm-alpine3.12-memcached` | [View](variants/7.2.34-fpm-alpine3.12-memcached ) |
| `:7.2.34-fpm-alpine3.12-sockets` | [View](variants/7.2.34-fpm-alpine3.12-sockets ) |
| `:7.2.34-fpm-alpine3.12-xdebug` | [View](variants/7.2.34-fpm-alpine3.12-xdebug ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-sockets ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-xdebug` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-xdebug ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-xdebug` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-xdebug ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-xdebug` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-xdebug ) |
| `:7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.2.34-fpm-alpine3.12-opcache-mysqli-gd-pdo-memcached-sockets-xdebug ) |
| `:7.3.26-fpm-alpine3.13-opcache` | [View](variants/7.3.26-fpm-alpine3.13-opcache ) |
| `:7.3.26-fpm-alpine3.13-mysqli` | [View](variants/7.3.26-fpm-alpine3.13-mysqli ) |
| `:7.3.26-fpm-alpine3.13-gd` | [View](variants/7.3.26-fpm-alpine3.13-gd ) |
| `:7.3.26-fpm-alpine3.13-pdo` | [View](variants/7.3.26-fpm-alpine3.13-pdo ) |
| `:7.3.26-fpm-alpine3.13-memcached` | [View](variants/7.3.26-fpm-alpine3.13-memcached ) |
| `:7.3.26-fpm-alpine3.13-sockets` | [View](variants/7.3.26-fpm-alpine3.13-sockets ) |
| `:7.3.26-fpm-alpine3.13-xdebug` | [View](variants/7.3.26-fpm-alpine3.13-xdebug ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-xdebug` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-xdebug ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug ) |
| `:7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.3.26-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug ) |
| `:7.4.14-fpm-alpine3.13-opcache` | [View](variants/7.4.14-fpm-alpine3.13-opcache ) |
| `:7.4.14-fpm-alpine3.13-mysqli` | [View](variants/7.4.14-fpm-alpine3.13-mysqli ) |
| `:7.4.14-fpm-alpine3.13-gd` | [View](variants/7.4.14-fpm-alpine3.13-gd ) |
| `:7.4.14-fpm-alpine3.13-pdo` | [View](variants/7.4.14-fpm-alpine3.13-pdo ) |
| `:7.4.14-fpm-alpine3.13-memcached` | [View](variants/7.4.14-fpm-alpine3.13-memcached ) |
| `:7.4.14-fpm-alpine3.13-sockets` | [View](variants/7.4.14-fpm-alpine3.13-sockets ) |
| `:7.4.14-fpm-alpine3.13-xdebug` | [View](variants/7.4.14-fpm-alpine3.13-xdebug ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-xdebug` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-xdebug ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug ) |
| `:7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/7.4.14-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug ) |
| `:8.0.1-fpm-alpine3.13-opcache`, `:latest` | [View](variants/8.0.1-fpm-alpine3.13-opcache ) |
| `:8.0.1-fpm-alpine3.13-mysqli` | [View](variants/8.0.1-fpm-alpine3.13-mysqli ) |
| `:8.0.1-fpm-alpine3.13-gd` | [View](variants/8.0.1-fpm-alpine3.13-gd ) |
| `:8.0.1-fpm-alpine3.13-pdo` | [View](variants/8.0.1-fpm-alpine3.13-pdo ) |
| `:8.0.1-fpm-alpine3.13-memcached` | [View](variants/8.0.1-fpm-alpine3.13-memcached ) |
| `:8.0.1-fpm-alpine3.13-sockets` | [View](variants/8.0.1-fpm-alpine3.13-sockets ) |
| `:8.0.1-fpm-alpine3.13-xdebug` | [View](variants/8.0.1-fpm-alpine3.13-xdebug ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-xdebug` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-xdebug ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-xdebug ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-xdebug ) |
| `:8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug` | [View](variants/8.0.1-fpm-alpine3.13-opcache-mysqli-gd-pdo-memcached-sockets-xdebug ) |
