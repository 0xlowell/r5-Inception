
#
#
## Run the server in the background and wait for it to start up before creating the database
##mariadbJC-install-db --datadir=/var/lib/mysql --auth-root-authentication-method=normal
#
## Give permissions to the database for the user mysql
#
#
## Start the server
##mysqld_safe --datadir=/var/lib/mysql &
#
#cat << EOF >
#FLUSH PRIVILEGES;
#
#DELETE FROM	mysql.user WHERE User='';
#DELETE FROM mysql.db WHERE Db='test';
#DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');
#
#ALTER USER 'root'@'localhost' IDENTIFIED BY '$MYSQL_ROOT_PWD';
#
#CREATE DATABASE IF NOT EXISTS $WORDPRESS_DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
#CREATE USER IF NOT EXISTS $WORDPRESS_DB_USER@'%' IDENTIFIED BY $WORDPRESS_DB_PASSWORD;
#GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO $WORDPRESS_DB_USER@'%';
#FLUSH PRIVILEGES;
#EOF
#
#exec mysqld_safe --datadir=/var/lib/mysql


#!/bin/bash
service mysql start

cat << EOF > /tmp/init_db.sql
CREATE DATABASE IF NOT EXISTS $WP_DATABASE_NAME;
CREATE USER IF NOT EXISTS '$WORDPRESS_DB_USER'@'%' IDENTIFIED BY '$WORDPRESS_DB_PASSWORD';
GRANT ALL PRIVILEGES ON $WORDPRESS_DB_NAME.* TO '$WORDPRESS_DB_USER'@'%';
ALTER USER 'root'@'localhost' IDENTIFIED BY '$WORDPRESS_ADMIN_PASSWORD';
FLUSH PRIVILEGES;
EOF

mysql -h localhost < /tmp/init_db.sql
#rm -rf /tmp/init_db.sql
#rm -rf /tmp/configure.sh