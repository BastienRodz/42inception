#!/bin/sh

sed -i "s/listen = \/run\/php\/php7.3-fpm.sock/listen = 9000/" "/etc/php/7.3/fpm/pool.d/www.conf";
chmod -R 777 /var/www/html/wordpress;
chown -R www-data /var/www/html/wordpress;
mkdir -p /run/php/;
touch /run/php/php7.3-fpm.pid;
rm -rf /var/www/html/wordpress/wp-config.php
cd /var/www/html/wordpress
set -o xtrace

if [ -f /var/www/html/wordpress/wp-config.php ]
	
then
	echo "Wordpress ready"

else
	curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar;
	chmod +x wp-cli.phar;
	cp wp-cli.phar /usr/local/bin/wp
	rm -rf /etc/php/7.3/fpm/pool.d/www.conf
	mv /usr/local/bin/www.conf /etc/php/7.3/fpm/pool.d

	wp core download --path=/var/www/html/wordpress/ --allow-root
	mv /var/www/index.html /var/www/html
	mv wp-cli.phar /var/www/html/wordpress/wp-cli.phar

	cd /var/www/html/wordpress

	mv /usr/local/bin/wp-config.php /var/www/html/wordpress/wp-config.php
	sed -i "s/username_here/$MYSQL_USER/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/password_here/$MYSQL_PASSWORD/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/localhost/$MYSQL_HOSTNAME/g" /var/www/html/wordpress/wp-config.php
	sed -i "s/database_name_here/$MYSQL_DATABASE/g" /var/www/html/wordpress/wp-config.php
	
	chmod -R 777 /var/www/html/wordpress
	chmod -R 777 /var/www/html/wordpress/wordpress

fi

echo "Wordpress has started.\n"
exec "$@"
