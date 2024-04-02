!/bin/sh

sleep 10

# echo "i am here"

service mariadb start

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
