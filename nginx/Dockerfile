# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/07/19 17:09:36 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update \
	&& apt-get install -y nginx openssl

RUN	rm /etc/nginx/nginx.conf

COPY	./conf/nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www

RUN mkdir /etc/nginx/ssl

RUN mkdir -p /run/nginx

RUN openssl req -x509 -nodes -days 365 -subj "/CN=barodrig" -newkey rsa:2048 -keyout /etc/ssl/barodrig.key -out /etc/ssl/barodrig.crt;

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off;"]
