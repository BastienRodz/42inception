# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 11:11:46 by barodrig          #+#    #+#              #
#    Updated: 2022/12/13 09:27:55 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster

EXPOSE 9000

WORKDIR /var/www/html/

RUN apt-get update && apt-get install -y \
	wget curl mariadb-client\
	php7.3 php-mysqli php-fpm

COPY ./conf/www.conf /usr/local/bin/
COPY ./tools/init_wordpress.sh /usr/local/bin/
COPY ./conf/wp-config.php /usr/local/bin/
COPY ./conf/index.html /var/www/
RUN	chmod +x /usr/local/bin/init_wordpress.sh
RUN mkdir -p /run/php

ENTRYPOINT [ "/usr/local/bin/init_wordpress.sh" ]

CMD ["/usr/sbin/php-fpm7.3", "-F"]
