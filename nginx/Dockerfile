# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/15 13:37:27 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y procps && apt-get -y install vim && apt-get -y install nginx && apt-get install -y openssl

COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=barodrig/CN=barodrig" -newkey rsa:2048 -keyout /etc/nginx/ssl/barodrig.key -out /etc/nginx/ssl/barodrig.crt;

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off"]
