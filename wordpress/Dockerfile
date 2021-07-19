# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 11:11:46 by barodrig          #+#    #+#              #
#    Updated: 2021/07/19 15:16:18 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster


RUN apt-get update
RUN apt-get -y install wget

RUN apt-get install -y \
	php7.3 \
	php7.3-mysql \
	php7.3-fpm \
	php7.3-curl \
	php7.3-gd \
	php7.3-intl \
	php7.3-mbstring \
	php7.3-soap \
	php7.3-xml \
	php7.3-xmlrpc \
	php7.3-zip


COPY ./conf/wp-config.php .

# Create WP directory
RUN mkdir -p /var/www

# Install WP
RUN wget http://wordpress.org/latest.tar.gz
RUN tar -zvxf latest.tar.gz && rm latest.tar.gz
RUN mv wordpress html && mv html /var/www/

COPY ./conf/www.conf /etc/php/7.3/fpm/pool.d/www.conf

RUN mv wp-config.php /var/www/html/wp-config.php

RUN mkdir -p /run/php/
COPY ./conf/init_wordpress.sh .


EXPOSE 9000

CMD ["bash","init_wordpress.sh"]
