#debian os
FROM debian

#Install Nginx + wordpress + php
RUN apt update -y && \
apt upgrade -y && \
apt install -y apt-transport-https ca-certificates curl software-properties-common gnupg wget

RUN curl -fsSL https://packages.sury.org/php/apt.gpg | apt-key add -

RUN add-apt-repository "deb https://packages.sury.org/php/ $(lsb_release -cs) main"

RUN apt update -y && apt install -y vim nginx wordpress php7.2 php7.2-cli php7.2-fpm php7.2-mysql php7.2-json php7.2-opcache php7.2-mbstring php7.2-xml php7.2-gd php7.2-curl

#Replace default.conf with wordpress.conf, fresh and homemade
COPY ./wordpress.conf /etc/nginx/conf.d/default.conf 

#Reload NGINX to apply the new WordPress domain settings.
RUN systemctl reload nginx

#In this step, download the archived WordPress file using wget and unzip it to the root of the WordPress installation that we have created in the previous step. To accomplish it run the following commands from the terminal.
RUN \
mkdir -p /var/www/html && \
wget https://wordpress.org/latest.tar.gz && \
tar -zxvf latest.tar.gz && \
mv wordpress/* /var/www/html/ && \
rm -rf wordpress


#Change the ownership and apply correct permissions to the extracted WordPress files and folders. To do that, use the following command from the terminal.
RUN \
chown -R www-data:www-data /var/www/html/*  && \
chmod -R 755 /var/www/html/*

#Now provide the database name, database user and the password in the WordPress config file so that it can connect to the MariaDB database that we had created earlier. By default, WordPress provides a sample configuration file and we will make use of it to create our own configuration file. To do that, first, rename the sample WordPress configuration file to wp-config.php and edit it with your own favorite editor.

COPY \
./wp-config-sample.php /var/www/html/wp-config.php


#Launcher
ENTRYPOINT ["nginx", "-g", "daemon off;"]
