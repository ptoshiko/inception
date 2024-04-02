FROM debian:11

RUN apt-get update && \
    apt-get install -y mariadb-server mariadb-client

RUN mkdir -p /var/run/mysqld \
        && chown -R mysql:mysql /var/run/mysqld \
        && chmod 777 /var/run/mysqld

COPY ./tools/setup.sh /var/local/bin/setup.sh

COPY ./conf/mysqld.conf /etc/mysql/my.cnf

RUN chmod +x /var/local/bin/setup.sh

EXPOSE 3306

CMD bash -c "/var/local/bin/setup.sh"
