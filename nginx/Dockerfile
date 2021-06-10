# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/10 14:39:13 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN echo "Configuring NGINX's container...\n"
RUN apt-get update && apt-get install -y procps && apt-get -y install vim && apt-get upgrade -y && apt-get -y install nginx

COPY ./init_nginx.sh ./
COPY ./nginx.conf ./
COPY ./default ./etc/nginx/sites-available

EXPOSE 443

CMD bash init_nginx.sh
RUN echo "NGINX's container configured !"
