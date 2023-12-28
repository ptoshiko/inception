#!/bin/sh

# mv /var/www/html/wp-config-sample.php /aboba.php

echo "Starting WP"
/usr/sbin/php-fpm7.4 -F
