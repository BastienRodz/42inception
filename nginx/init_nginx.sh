# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_nginx.sh                                      :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/10 14:04:26 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 12:07:35 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


#Configuring Authorizations
chown -R www-data /var/www/*
chmod -R 755 /var/www/*

# Generate website file
touch /var/www/html/index.php
echo "<?php phpinfo(); ?>" >> /var/www/html/index.php

#SSL Certificate Setting


service nginx start

bash
