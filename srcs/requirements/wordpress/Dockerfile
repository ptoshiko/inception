FROM debian:11

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	net-tools \ 
	&& rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php


# COPY conf/config.sh /usr/local/bin/
# RUN	chmod +x /usr/local/bin/config.sh
# ENTRYPOINT ["/usr/local/bin/config.sh"]

WORKDIR /var/www/html/

RUN wget http://wordpress.org/latest.tar.gz && \
			tar xfz latest.tar.gz && \
			mv wordpress/* . && \
			rm -rf latest.tar.gz && \
			rm -rf wordpress 

EXPOSE 9000

# RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php

# RUN sed -i "s/username_here/$SQL_USER/" /var/www/html/wp-config.php
# RUN sed -i 's/username_here/$SQL_USER/' /var/www/html/wp-config.php
# RUN sed -i 's/username_here/$SQL_USER/' /var/www/html/wp-config.php
# RUN sed -i 's/username_here/$SQL_USER/' /var/www/html/wp-config.php

# !!! to set set connection with db by config 
COPY conf/wp-config.php /var/www/html/wp-config-sample.php
RUN mv /var/www/html/wp-config-sample.php /var/www/html/wp-config.php


COPY conf/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["sh", "/usr/local/bin/start.sh"]
