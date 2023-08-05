#!/usr/bin/env sh
set -e

nginx -g 'daemon off;'
php-fpm -D