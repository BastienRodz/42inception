# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 11:11:46 by barodrig          #+#    #+#              #
#    Updated: 2021/07/20 14:48:19 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM debian:buster


RUN apt-get update

RUN apt-get install -y \
	wget \
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


COPY ./conf/init_wordpress.sh .

# Create WP directory
RUN mkdir -p /var/www && mkdir -p /run/php/php-fpm7.3

RUN sed -i 's/listen = 127\.0\.0\.1:9000/listen = 0\.0\.0\.0:9000/g' /etc/php/7.3/fpm/pool.d/www.conf

EXPOSE 9000

ENTRYPOINT [ "sh", "./init_wordpress.sh" ]

CMD ["php-fpm7.3", "-F"]
