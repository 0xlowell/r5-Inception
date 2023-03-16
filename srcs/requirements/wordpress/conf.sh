# Wait for mariadb launch
sleep 5
while ! mariadb -h$HOSTNAME -u$MARIADB_USER -p$MARIADB_PASSWORD $MARIADB_NAME; do
  sleep 3
done
sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;

chown -R www-data:www-data /var/www/*;
chown -R 755 /var/www/*;

wp core download  --allow-root

wp core config \
  --dbname=$MARIADB_NAME \
  --dbuser=$MARIADB_USER \
  --dbpass=$MARIADB_PASSWORD \
  --dbhost=$WP_HOST \
  --dbcharset="utf8" \
  --dbcollate="utf8_general_ci" \
  --allow-root

wp core install \
  --url=$DOMAIN_NAME \
  --title=$WP_TITLE \
  --admin_user=$WP_ADMIN_USR \
  --admin_password=$WP_ADMIN_PWD \
  --admin_email=$WP_ADMIN_EMAIL --skip-email \
  --allow-root

wp user create \
  $WP_USER \
  $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root


#wp theme install inspiro --activate --allow-root

/usr/sbin/php-fpm7.3 -F -R
