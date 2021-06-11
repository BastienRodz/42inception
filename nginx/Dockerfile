# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 12:17:31 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get install -y procps && apt-get -y install vim && apt-get upgrade -y && apt-get -y install nginx && apt-get install -y openssl

RUN rm /etc/nginx/sites-available/default && rm /etc/nginx/sites-enabled/default
COPY ./nginx.conf /etc/nginx/sites-available/default
RUN ln -s /etc/nginx/sites-available/defaut /etc/nginx/sites-enabled/default
COPY ./default ./etc/nginx/sites-available

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=barodrig/CN=barodrig" -newkey rsa:2048 -keyout /etc/nginx/ssl/localhost.key -out /etc/nginx/ssl/localhost.crt;

RUN chmod -R 755 /var/www/*
RUN chmod 755 /etc/nginx/ssl
RUN chown -R www-data:www-data /var/www/*

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off"]
