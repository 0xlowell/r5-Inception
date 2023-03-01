# Use an official Nginx runtime as a parent image
FROM debian:buster

RUN apt update -y && apt upgrade -y
RUN apt install -y wget curl nginx openssl

RUN mkdir -p /etc/nginx/ssl

# Create ssl certif with openssl
RUN openssl req -newkey rsa:4096 -x509 -sha256 -days 365 -nodes \
    -out /etc/nginx/ssl/cert.pem \
    -keyout /etc/nginx/ssl/cert.key \
    -subj '/C=CH/ST=Lausanne/L=Lausanne/O=42/OU=lzima/CN=lzima/'

RUN mkdir -p /run/nginx

# Expose the default Nginx HTTP port (80)
EXPOSE 443

COPY nginx.conf /etc/nginx/conf.d/default.conf

# Start Nginx in the foreground when the container is started
CMD ["nginx", "-g", "daemon off;"]

