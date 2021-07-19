# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/07/13 14:44:49 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update \
	&& apt-get install -y nginx openssl \
	&& rm /etc/nginx/nginx.conf

COPY	./nginx.conf /etc/nginx/nginx.conf

RUN	chmod 755 /var/www

COPY ./hosts /etc/

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=barodrig/CN=barodrig" -keyout /etc/nginx/ssl/barodrig.key -out /etc/nginx/ssl/barodrig.crt;

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off"]
