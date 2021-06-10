# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_nginx.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/10 14:04:26 by barodrig          #+#    #+#              #
#    Updated: 2021/06/10 16:09:53 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#Configuring Authorizations
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# Generate website file
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

#SSL Certificate Setting
apt-get install openssl
openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=barodrig/CN=localhost" -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt;
mv ~/nginx.conf /etc/nginx/

service nginx start

bash
