#!/bin/sh

chmod 777 /var/www/html/wordpress
nginx -g 'daemon off;';

exec "$@"