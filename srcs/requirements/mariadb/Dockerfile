FROM debian:11

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client


RUN mkdir -p /var/run/mysqld \
        # && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

COPY ./conf/mysqld.conf /etc/mysql/my.cnf

RUN mysql_install_db --user=mysql --datadir=/var/lib/mysql

EXPOSE 3306

COPY ./tools/setup.sh /var/local/bin/setup.sh

RUN chmod +x /var/local/bin/setup.sh

USER mysql

# CMD bash -c "/var/local/bin/setup.sh"
CMD ["/usr/bin/mysqld", "--skip-log-error"]