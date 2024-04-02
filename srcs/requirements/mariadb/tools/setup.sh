!/bin/sh

sleep 10

service mariadb start

mysql -u root <<EOF
CREATE DATABASE IF NOT EXISTS \`${SQL_DATABASE}\`;
CREATE USER IF NOT EXISTS \`${SQL_USER}\`@'%' IDENTIFIED BY '${SQL_PASSWORD}';
GRANT ALL PRIVILEGES ON \`${SQL_DATABASE}\`.* TO \`${SQL_USER}\`@'%';
FLUSH PRIVILEGES;
EOF

service mariadb stop

# Wait for the MySQL server to stop 
sleep 5

# # Start the MySQL server for normal operation
exec mysqld
