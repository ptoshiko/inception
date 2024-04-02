FROM debian:11

ARG SQL_DATABASE \
    SQL_USER \
   	SQL_PASSWORD

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client


# RUN mkdir -p /var/run/mysqld \
#         # && chown -R mysql:mysql /var/run/mysqld \
#         && chmod 777 /var/run/mysqld

RUN mkdir /var/run/mysqld; \
    chmod 777 /var/run/mysqld; \
    { echo '[mysqld]'; \
      echo 'skip-host-cache'; \
      echo 'skip-name-resolve'; \
      echo 'bind-address=0.0.0.0'; \
    } | tee  /etc/my.cnf.d/docker.cnf; \
    sed -i "s|skip-networking|skip-networking=0|g" \
      /etc/mysql/my.cnf

# COPY ./conf/mysqld.conf /etc/mysql/my.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

# COPY ./tools/setup.sh /var/local/bin/setup.sh

# RUN sh /var/local/bin/setup.sh

# USER mysql

# # CMD bash -c "/var/local/bin/setup.sh"
# CMD ["mysqld", "--skip-log-error"]

COPY requirements/mariadb/tools/setup.sh .
RUN sh setup.sh && rm setup.sh
USER mysql
CMD ["/usr/bin/mysqld", "--skip-log-error"]