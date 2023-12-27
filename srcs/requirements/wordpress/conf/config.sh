#!/bin/bash

#check if wp-config.php exist
echo "$SQL_USER"

if [ -f ./wp-config.php ]
then
	echo "wordpress already downloaded"
else

	#Download wordpress and all config files
	wget http://wordpress.org/latest.tar.gz
	tar xfz latest.tar.gz
	mv wordpress/* .
	rm -rf latest.tar.gz
	rm -rf wordpress

	#Import env variables in the config file
	# sed -i "" -e "s/username_here/$SQL_USER/g" wp-config-sample.php
  	# sed -i "" -e "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
  	# sed -i "" -e "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
  	# sed -i "" -e "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php

	sed -e "s/username_here/$SQL_USER/g" -e "s/password_here/$SQL_PASSWORD/g" \
	-e "s/localhost/$SQL_HOSTNAME/g" -e "s/database_name_here/$SQL_DATABASE/g" \
	wp-config-sample.php > wp-config.php

	# sed -i "s/username_here/$SQL_USER/g" wp-config-sample.php
	# sed -i "s/password_here/$SQL_PASSWORD/g" wp-config-sample.php
	# sed -i "s/localhost/$SQL_HOSTNAME/g" wp-config-sample.php
	# # sed -i "s/localhost/192.168.112.1/g" wp-config-sample.php
	# sed -i "s/database_name_here/$SQL_DATABASE/g" wp-config-sample.php
	
	cp wp-config-sample.php wp-config.php

fi

exec "$@"