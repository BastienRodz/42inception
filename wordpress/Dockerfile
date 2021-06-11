# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 11:11:46 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 13:30:19 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get install -y procps && apt-get -y install vim && apt-get install -y wget && apt-get upgrade -y
RUN apt-get -y install php7.3-fpm php7.3-common php7.3-mysql php7.3-gmp php7.3-curl php7.3-intl php7.3-mbstring php7.3-xmlrpc php7.3-gd php7.3-xml php7.3-cli php7.3-zip php7.3-soap php7.3-imap
RUN apt-get -y instal openssl sendmail mariad-client

COPY ./init_wordpress.sh ./
RUN chmod 755 init_wordpress.sh
RUN mkdir tmp
RUN mkdir /var/www/wordpress/ && chown -R www-data /var/www/* && chmod -R 755 /var/www/*
COPY ./config.inc.php ./tmp/config.inc.php
COPY ./wp-config.php ./tmp/wp-config.php

EXPOSE 9000

ENTRYPOINT ["sh", "./init_wordpress.sh"]
