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

# Downloads core WordPress files.
wp core download  --allow-root

# Generates a wp-config.php file.
wp config create \
  --dbname=$MARIADB_NAME \
  --dbuser=$MARIADB_USER \
  --dbpass=$MARIADB_PASSWORD \
  --dbhost=$HOSTNAME \
  --dbcharset="utf8" --dbcollate="utf8_general_ci" --allow-root

# Runs the standard WordPress installation process.
wp core install \
  --url="$DOMAIN_NAME" \
  --title=$WP_TITLE \
  --admin_user=$WP_ADMIN_USER \
  --admin_password=$WP_ADMIN_PASSWORD \
  --admin_email=$WP_ADMIN_EMAIL --skip-email --allow-root

# Creates a new user.
wp user create \
  $WP_USER \
  $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --allow-root

/usr/sbin/php-fpm7.3 -F -R
