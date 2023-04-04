# Debian OS
FROM debian:buster

#Install php vim mariadb-client
RUN apt upgrade -y && apt update -y && apt install -y php7.3 php-mysqli php7.3-fpm wget vim mariadb-client bash
RUN adduser  nginx && groupadd -f nginx
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

RUN cp wp-cli.phar /usr/local/bin/wp

WORKDIR /var/www/html

# Copy script to set up wordpress variables
COPY conf.sh /tmp/conf.sh

# PHP Pool Directives (default name is www.conf) PHP FastCGI Process Manager (PHP-FPM)
COPY ./www.conf /etc/php/7.3/www.conf

#Launcher
ENTRYPOINT ["/bin/sh", "/tmp/conf.sh"]
