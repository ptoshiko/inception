FROM debian:11

RUN apt update
RUN apt upgrade
RUN apt install nginx -y

RUN apt install vim -y    
RUN apt install curl -y

# for TLS 
# ok
RUN mkdir -p /etc/nginx/ssl
RUN apt install openssl -y

RUN  openssl req -x509 -nodes\
		-out /etc/nginx/ssl/inception.crt\
		-keyout /etc/nginx/ssl/inception.key\
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ptoshiko.42.fr/UID=ptoshiko"

# Copy your custom NGINX configuration file
COPY conf/nginx.conf /etc/nginx/nginx.conf

# nginx config
RUN mkdir -p /run/nginx

#the only port allowed
EXPOSE	443


## is neccessary ??
# RUN chmod -R 755 /var/www/html 
# RUN chown -R www-data:www-data /var/www/html 

# # Adjust permissions for SSL files
# RUN chown -R root:root /etc/nginx/ssl
# RUN chmod 600 /etc/nginx/ssl/inception.crt /etc/nginx/ssl/inception.key
## 

CMD ["nginx", "-g", "daemon off;"]

