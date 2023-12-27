FROM debian:11

# Install MariaDB server and client
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

# Copy your script and SQL file to the container
# COPY ./scripts/setup.sh /var/local/bin/
RUN mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

COPY ./tools/setup.sh /var/local/bin/setup.sh
# Give execute permissions to your script
RUN chmod +x /var/local/bin/setup.sh

# Launch your setup script to install MariaDB
# RUN /var/local/bin/setup.sh

EXPOSE 3306

# Set CMD to make MariaDB listen on all IPv4 addresses
# CMD ["", "--bind-address=0.0.0.0"]
CMD ["sh", "/var/local/bin/setup.sh", "--bind-address=127.0.0.1", "port=3306"]
# CMD [""]