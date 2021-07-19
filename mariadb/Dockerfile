# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/07/19 16:23:44 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y && apt-get install -y wget vim bash \
	mariadb-server mariadb-client gettext-base

RUN	rm /etc/mysql/my.cnf \
	&& echo "[mysqld]\ngeneral_log=1\nuser=root\nport=3306\nbind=0.0.0.0\nskip-networking=false" > /etc/mysql/my.cnf

COPY	./conf/init_mysql.sh .

RUN	chmod 755 ./init_mysql.sh \
	&& chown -R mysql:mysql /var/lib/mysql

EXPOSE 3306

ENTRYPOINT ["./init_mysql.sh"]
