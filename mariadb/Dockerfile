# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 13:35:04 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get install -y procps && apt-get -y install vim && apt-get upgrade -y && apt-get -y install mariadb-server

COPY ./init_mariadb.sh ./
RUN chmod 755 init_mariadb.sh

EXPOSE 3306

ENTRYPOINT ["sh", "./init_mariadb"]
