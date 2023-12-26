#!/bin/bash

# sleep 10

# wp core download --allow-root --path='/var/www/wordpress'

# if [ ! -f "/var/www/wordpress/wp-config.php" ]; then
# wp config create 	--allow-root \
# 					--dbname=$SQL_DATABASE \
# 					--dbuser=$SQL_USER \
# 					--dbpass=$SQL_PASSWORD \
# 					--dbhost=mariadb:3306 --path='/var/www/wordpress'
# fi


# sleep 10

# # Download WordPress core files if not present
# wp core download --allow-root --path='/var/www/wordpress'

# # Check if wp-config.php exists
# if [ ! -f "/var/www/wordpress/wp-config-sample.php" ]; then
#     # Create wp-config.php
#     wp config create --allow-root \
#         --dbname="$SQL_DATABASE" \
#         --dbuser="$SQL_USER" \
#         --dbpass="$SQL_PASSWORD" \
#         --dbhost="mariadb:3306" \
#         --path='/var/www/wordpress'

#     # Check for a successful database connection
#     wp config path --allow-root --path='/var/www/wordpress' > /dev/null 2>&1
#     if [ $? -eq 1 ]; then
#         echo "Error: Unable to connect to the database. Please check your database configuration."
#         exit 1
#     fi
# fi


#check if wp-config.php exist
if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Download wordpress and all config file
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Inport env variables in the config file
	sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	sed -i "s/localhost/192.168.112.1/g" wp-config-sample.php
	sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	cp wp-config-sample.php wp-config.php

fi

exec "$@"