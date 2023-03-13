/** Remove default mysql user **/
DROP DATABASE IF EXISTS test;
DELETE FROM mysql.db WHERE Db='test';
DELETE FROM mysql.user WHERE User='';
DELETE FROM mysql.user WHERE User='root' AND Host NOT IN ('localhost', '127.0.0.1', '::1');

/** Setup mysql root password **/
SET PASSWORD FOR 'root'@'localhost' = PASSWORD('$MARIADB_ROOT_PASSWORD');

/** Create database and user for the project */
CREATE DATABASE IF NOT EXISTS $MARIADB_NAME;
CREATE USER IF NOT EXISTS '$WP_USER'@'%' IDENTIFIED BY '$WP_PASSWORD';
GRANT ALL PRIVILEGES ON $WP_NAME.* TO $WP_USER@'%';

/** Apply changes **/
FLUSH PRIVILEGES;