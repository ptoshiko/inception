#!/bin/sh

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

# wp core download --allow-root



wp core install --allow-root \
	--url=127.0.0.1 \
	--title="angelina's blog" \
	--admin_user=$SQL_USER \
	--admin_password=$SQL_PASSWORD \
	--admin_email=admin@admin.admin

wp user create --allow-root $WP_SECOND_USER $WP_SECOND_EMAIL\
	--user_pass=${WP_SECOND_PASSWORD}

echo "Starting WP"
/usr/sbin/php-fpm7.4 -F
