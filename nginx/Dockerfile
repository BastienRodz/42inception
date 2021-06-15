# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/15 16:33:24 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get upgrade -y
RUN apt-get -y install vim && apt-get -y install nginx && apt-get -y install openssl

COPY ./nginx.conf /etc/nginx/nginx.conf
COPY ./hosts /etc/

RUN mkdir /etc/nginx/ssl
RUN openssl req -x509 -nodes -days 365 -newkey rsa:2048 -subj "/C=FR/ST=PARIS/L=PARIS/O=42 School/OU=barodrig/CN=barodrig" -keyout /etc/nginx/ssl/barodrig.key -out /etc/nginx/ssl/barodrig.crt;

EXPOSE 443

ENTRYPOINT ["nginx", "-g", "daemon off"]
