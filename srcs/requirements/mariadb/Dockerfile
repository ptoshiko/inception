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

COPY ./conf/mysqld.conf /etc/mysql/my.cnf

# COPY conf/50-server.cnf	/etc/mysql/mariadb.conf.d/50-server.cnf

# Give execute permissions to your script
RUN chmod +x /var/local/bin/setup.sh

# Launch your setup script to install MariaDB
# RUN /var/local/bin/setup.sh

EXPOSE 3306

CMD bash -c "/var/local/bin/setup.sh"

# CMD ["sh", "/var/local/bin/setup.sh"]