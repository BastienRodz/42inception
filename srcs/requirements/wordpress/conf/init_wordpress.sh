# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_wordpress.sh                                  :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/07/20 13:33:09 by barodrig          #+#    #+#              #
#    Updated: 2021/07/20 15:09:06 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/bin/sh

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar -O /usr/local/bin/wp
chmod +x /usr/local/bin/wp

wp core download --path=/var/www --locale=fr_FR --allow-root

wp config create --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --dbhost=mariadb --path=/var/www/ --dbprefix=wp_ --allow-root

wp core install --url="barodrig.42.fr" --title="TEST" --admin_user="$WP_ADMIN" --admin_password="$WP_ADPASS" --admin_email="$WP_ADMIN@email.com" --path=/var/www/ --allow-root

wp user create $WP_USER $WP_USER@email.com --role="author" --user_pass="$WP_USPASS" --path="/var/www" --allow-root

exec "$@"
