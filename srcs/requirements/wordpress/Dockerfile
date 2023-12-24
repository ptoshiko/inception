
FROM debian:11

# RUN apt update
# RUN apt-get upgrade
# RUN apt install -y wget

# RUN apt-get install -y php7.3
# RUN apt-get install -y php-fpm
# RUN apt-get install -y php-mysql
# RUN apt-get install -y curl 
# RUN apt-get install -y bash 
# RUN rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get -y install \
	wget \
	curl \
	bash \
	php7.3 \
	php-cgi \
	php-mysql \
	php-fpm \
	php-pdo \
	php-gd php-cli \
	php-mbstring \
	redis \
	php-redis \
	&& rm -rf /var/lib/apt/lists/*


RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar
RUN mv wp-cli.phar /usr/local/bin/wp

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/

RUN mkdir /run/php


COPY conf/config.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/config.sh
ENTRYPOINT ["/usr/local/bin/config.sh"]

#We go the html directory
WORKDIR /var/www/html/

#We expose the 9000 port
EXPOSE 9000

#Launch PHP FPM in foreground and ignore deamonize from conf file (-F)
CMD ["/usr/sbin/php-fpm7.4", "-F"]


