# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 11:11:46 by barodrig          #+#    #+#              #
#    Updated: 2021/06/15 15:42:55 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y procps && apt-get -y install vim && apt-get install -y wget
RUN apt-get -y install php7.3-fpm php7.3-mysql

COPY ./init_wordpress.sh /init_wordpress.sh
RUN chmod +x init_wordpress.sh
ADD https://wordpress.org/latest.tar.gz /tmp/wordpress.tar.gz
RUN mkdir /var/www && mkdir var/www/wordpress \
	&& cd /tmp && tar -zxvf wordpress.tar.gz \
	&& mv -f wordpress /var/www/wordpress && chown -R www-data:www-data /var/www/wordpress \
	&& chmod -R 755 /var/www/wordpress
COPY ./wp-config.php ./var/wwww/wordpress/wp-config.php

EXPOSE 9000

ENTRYPOINT ["sh", "./init_wordpress.sh"]
