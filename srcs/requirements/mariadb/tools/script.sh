# !/bin/sh

sleep 10

mysql -u root <<EOF
USE mysql;
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'localhost' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
ALTER USER 'root'@'localhost' IDENTIFIED BY '${SQL_ROOT_PASSWORD}';
FLUSH PRIVILEGES;
EOF

# Stop the MySQL server
mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# Wait for the MySQL server to stop (adjust the sleep time if needed)
sleep 5

# Start the MySQL server for normal operation
exec mysqld



# mysql_upgrade

# /etc/init.d/mysql start

# #Check if the database exists

# if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
# then 

# 	echo "Database already exists"
# else

# # Set root option so that connexion without root password is not possible

# mysql_secure_installation << _EOF_

# Y
# root4life
# root4life
# Y
# n
# Y
# Y
# _EOF_

# #Add a root user on 127.0.0.1 to allow remote connexion 
# #Flush privileges allow to your sql tables to be updated automatically when you modify it
# #mysql -uroot launch mysql command line client
# echo "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;" | mysql -uroot

# #Create database and user in the database for wordpress
# echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;" | mysql -u root

# #Import database in the mysql command line
# mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

# fi

# /etc/init.d/mysql stop

# exec "$@"