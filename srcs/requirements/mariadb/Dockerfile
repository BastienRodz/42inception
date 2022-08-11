# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2021/07/20 15:07:14 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y && apt-get install -y\
	mariadb-server mariadb-client

COPY	./conf/init_mysql.sh .

RUN	chmod 755 ./init_mysql.sh \
	&& chown -R mysql:mysql /var/lib/mysql \
	&& mkdir /run/mysqld && chown mysql /run/mysqld

RUN	mysql_install_db --user=mysql --datadir=/var/lib/mysql --auth-root-authentication-method=normal

RUN sed -i "s|.*skip-networking.*|skip-networking = false|g" /etc/mysql/my.cnf && sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|g" /etc/mysql/my.cnf

EXPOSE	3306

ENTRYPOINT ["./init_mysql.sh"]
