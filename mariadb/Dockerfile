# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/06/15 15:17:41 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

From debian:buster

RUN apt-get update && apt-get upgrade -y && apt-get install -y procps && apt-get -y install vim && apt-get -y install mariadb-server

COPY ./init_mariadb.sh /init_mariadb.sh
COPY ./tools/my.cnf ./my.cnf

RUN chmod +x ./init_mariadb.sh && mv my.cnf etc/mysql/my.cnf && chmod 755 /etc/mysql/my.cnf

EXPOSE 3306

ENTRYPOINT ["sh", "./init_mariadb.sh"]
