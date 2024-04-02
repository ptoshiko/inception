FROM debian:11

RUN apt update && \
    apt upgrade -y && \
    apt install -y \
        nginx \
        vim \
        curl \
        openssl

RUN mkdir -p /etc/nginx/ssl

RUN  openssl req -x509 -nodes\
		-out /etc/nginx/ssl/inception.crt\
		-keyout /etc/nginx/ssl/inception.key\
		-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=ptoshiko.42.fr/UID=ptoshiko"

COPY conf/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /run/nginx

EXPOSE	443

CMD ["nginx", "-g", "daemon off;"]

