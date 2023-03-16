FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y wget curl nginx openssl

RUN mkdir -p /etc/nginx/ssl

RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/cert.pem \
    -keyout /etc/nginx/ssl/cert.key \
    -subj '/C=CH/ST=Lausanne/L=Lausanne/O=42/OU=lzima/CN=lzima/'

RUN mkdir -p /run/nginx

RUN chown -R www-data:www-data /var/www/*
RUN chown -R 755 /var/www/*

EXPOSE 443

COPY nginx.conf /etc/nginx/conf.d/default.conf

CMD ["nginx", "-g", "daemon off;"]

