FROM debian:11

# Install MariaDB Server
RUN apt update -y && \
    apt install -y mariadb-server\
    mariadb-client\
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

EXPOSE 3306

COPY tools/script.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/script.sh

CMD ["sh", "/usr/local/bin/script.sh"] 

# Set entry point to run the initialization script
# ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]

# CMD ["mysqld", "--bind-address=0.0.0.0", "--socket=/var/run/mysqld/mysqld.sock"]