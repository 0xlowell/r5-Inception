# Debian OS
FROM debian:buster

#Install php vim mariadb-client
RUN apt upgrade -y && apt update -y && apt install -y php7.3 php-mysqli php7.3-fpm wget vim mariadb-client

RUN wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
RUN chmod +x wp-cli.phar

RUN cp wp-cli.phar /usr/local/bin/wp

#Self managing folder: /var/www/html/wordpress
WORKDIR /var/www/html/wordpress

#
COPY ./conf.sh /tmp/conf.sh
COPY ./www.conf /etc/php/7.3/www.conf
#
RUN chmod -R 755 /var/www/* #html/wordpress/*
RUN chown -R www-data:www-data /var/www/* #html/wordpress/*

COPY ./wp-config-sample.php /var/www/html/wordpress/wp-config.php

#COPY run.sh run.sh
#RUN chmod +x run.sh

#Launcher
ENTRYPOINT ["/bin/bash", "/tmp/conf.sh"]
