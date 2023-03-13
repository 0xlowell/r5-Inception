# Debian OS
FROM debian:buster

#Install php vim mariadb-client
RUN apt upgrade -y && apt update -y && apt install -y php7.3 php-mysqli php7.3-fpm wget vim mariadb-client bash
RUN adduser  nginx && groupadd -f nginx
RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

RUN cp wp-cli.phar /usr/local/bin/wp

#Self managing folder: /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

COPY conf.sh /tmp/conf.sh
COPY ./www.conf /etc/php/7.3/www.conf
COPY /conf/wp-config.php /var/www/html/wp-config.php

#Launcher
ENTRYPOINT ["/bin/sh", "/tmp/conf.sh"]
