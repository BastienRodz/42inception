# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_wordpress.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 12:07:34 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 13:16:12 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#Configuring wordpress database
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

#Installing PhpMyAdmin
cd /var/www/html/
wget https://files.phpmyadmin.net/phpMyAdmin/5.0.1/phpMyAdmin-5.0.1-english.tar.gz
tar -xvf phpMyAdmin-5.0.1-english.tar.gz && rm -rf phpMyAdmin-5.0.1-english.tar.gz
mv phpMyAdmin-5.0.1-english/  phpmyadmin/
mv /tmp/config.inc.php /var/www/html/phpmyadmin/
rm /var/html/phpmyadmin/config.sample.inc.php
cd ../../../../

#Installing Wordpress
cd /tmp/
wget https://wordpress.org/latest.tar.gz
tar -xvf latest.tar.gz && rm -rf latest.tar.gz
mv wordpress/* /var/www/wordpress
mv /tmp/wp-config.php /var/www/wordpress/
cd ../
rm /var/www/wordpress/wp-config-sample.php
mkdir /var/www/wordpress/phpmyadmin/tmp

php7.3-fpm --nodaemonize

bash
