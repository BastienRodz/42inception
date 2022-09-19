# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2022/09/08 10:57:13 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update \
	&& apt-get install -y nginx openssl

EXPOSE	443

RUN mkdir -p /var/www/html/barodrig.42.fr

RUN openssl req -newkey rsa:4096 -x509 -days 365 -nodes -out /etc/ssl/certs/barodrig.42.fr.crt -keyout /etc/ssl/private/barodrig.42.fr.key -subj "/C=FR/ST=PARIS/CN=barodrig"

COPY conf/default /etc/nginx/sites-enabled/default
COPY tools/launch_nginx.sh /var/www

CMD bash /var/www/launch_nginx.sh
