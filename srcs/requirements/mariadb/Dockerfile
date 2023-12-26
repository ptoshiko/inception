# FROM debian:11

# # Install MariaDB Server
# RUN apt update -y && \
#     apt install -y mariadb-server\
#     mariadb-client\
#     vim \
#     && rm -rf /var/lib/apt/lists/*

# RUN mkdir -p /var/run/mysqld \
#         && chown -R mysql:mysql /var/run/mysqld \
#         && chmod 777 /var/run/mysqld

# EXPOSE 3306

# COPY tools/script.sh /usr/local/bin/
# COPY conf/wordpress.sql /usr/local/bin/

# RUN chmod +x /usr/local/bin/script.sh
# RUN chmod +x /usr/local/bin/wordpress.sql


# CMD ["sh", "/usr/local/bin/script.sh"] 

# # Set entry point to run the initialization script
# ENTRYPOINT ["sh", "/usr/local/bin/script.sh"]

# CMD ["mysqld", "--bind-address=0.0.0.0"]



FROM debian:11

# Install MariaDB server and client
RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

# Copy your script and SQL file to the container
# COPY ./scripts/setup.sh /var/local/bin/
RUN mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

COPY ./tools/script.sh /var/local/bin/setup.sh
# Give execute permissions to your script
RUN chmod +x /var/local/bin/setup.sh

# Launch your setup script to install MariaDB
# RUN /var/local/bin/setup.sh

EXPOSE 3306

# Set CMD to make MariaDB listen on all IPv4 addresses
# CMD ["", "--bind-address=0.0.0.0"]
CMD ["sh", "/var/local/bin/setup.sh"]
# CMD [""]