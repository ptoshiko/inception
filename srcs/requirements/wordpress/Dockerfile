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
	redis \
	php-redis \
	net-tools \ 
	&& rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/

RUN mkdir /run/php


COPY conf/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

COPY conf/start.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/start.sh

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["sh", "/usr/local/bin/start.sh"]


