#!/bin/sh

chown -R www-data:www-data /var/www/*
chmod -R 755 /var/www/*

# wp core download --allow-root

sed -i "s/username_here/$SQL_USER/g" /var/www/html/wp-config-sample.php
sed -i "s/password_here/$SQL_PASSWORD/g" /var/www/html/wp-config-sample.php
sed -i "s/hostname_here/$SQL_HOSTNAME/g" /var/www/html/wp-config-sample.php
sed -i "s/database_name_here/$SQL_DATABASE/g"  /var/www/html/wp-config-sample.php
mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

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
