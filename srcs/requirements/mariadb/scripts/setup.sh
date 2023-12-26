
#!/bin/bash

# Initialize MariaDB data directory
mysql_install_db --datadir=/var/lib/mysql

# Start MariaDB server
service mysql start

# Wait for MariaDB to start
sleep 5

# Create the root user and grant privileges
mysql -e "CREATE USER '$SQL_USER'@'localhost' IDENTIFIED BY '$SQL_ROOT_PASSWORD';"
mysql -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER'@'localhost' WITH GRANT OPTION;"
mysql -e "FLUSH PRIVILEGES;"

# Stop MariaDB server
service mysql stop