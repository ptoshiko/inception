# !/bin/sh

sleep 10

echo "i am here"

service mariadb start

# mysqladmin -u root password `${SQL_ROOT_PASSWORD}`

# mysql -u root -p`${SQL_ROOT_PASSWORD}`<<EOF
mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';
FLUSH PRIVILEGES;
EOF

echo "now i am here"

service mariadb stop

# Wait for the MySQL server to stop (adjust the sleep time if needed)
sleep 5

# # Start the MySQL server for normal operation
exec mysqld






# sleep 10

# mysql -u root<<EOF
# USE mysql;
# FLUSH PRIVILEGES;

# DELETE FROM	mysql.user WHERE User='';
# DROP DATABASE test;
# DELETE FROM mysql.db WHERE Db='test';
# DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

# ALTER USER 'root'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';

# CREATE DATABASE $SQL_DATABASE CHARACTER SET utf8 COLLATE utf8_general_ci;
# CREATE USER '$SQL_USER'@'%' IDENTIFIED by '$SQL_PASSWORD';
# GRANT ALL PRIVILEGES ON $SQL_DATABASE.* TO '$SQL_USER'@'%';

# FLUSH PRIVILEGES;
# EOF

# # Stop the MySQL server
# # mysqladmin -u root -p"${SQL_ROOT_PASSWORD}" shutdown

# # Wait for the MySQL server to stop (adjust the sleep time if needed)
# sleep 5

# # Start the MySQL server for normal operation
# exec mysqld