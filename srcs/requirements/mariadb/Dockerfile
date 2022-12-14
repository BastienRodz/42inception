# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2022/12/12 11:09:54 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

EXPOSE 3306

RUN	apt-get update && apt-get upgrade -y\
	&& apt-get install -y mariadb-server mariadb-client\
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/run/mysql \
	&& chown -R mysql:mysql /var/run/mysql \
	&& chmod -R 777 /var/run/mysql

COPY	./tools/init_mysql.sh /usr/local/bin/
COPY    ./conf/wordpress.sql /usr/local/bin/wordpress.sql

RUN	chmod -R 777 /usr/local/bin
RUN chmod -R 777 /var/log/mysql 

ENTRYPOINT ["/usr/local/bin/init_mysql.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0", "--log-error=/var/lib/mysql/error.log"]
