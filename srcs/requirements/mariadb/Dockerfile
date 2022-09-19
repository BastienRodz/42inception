# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Dockerfile                                         :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/06/08 10:28:32 by barodrig          #+#    #+#              #
#    Updated: 2022/09/19 16:42:15 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

FROM	debian:buster

RUN	apt-get update && apt-get upgrade -y && apt-get install -y\
	mariadb-server && rm -rf /var/lib/apt/lists/*
	
RUN rm -rf /var/run/mysqld
RUN mkdir /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld/ && chmod -R 755 /var/run/mysqld/
RUN mkdir -p /var/lib/mysql-files/ && mkdir -p /var/lib/mysqld/log/

RUN chown -R mysql:mysql /var/run/mysqld && chmod 777 /var/run/mysqld

COPY	./tools/init_mysql.sh /usr/local/bin/

RUN	chmod +x /usr/local/bin/init_mysql.sh

RUN chmod -R 777 /var/log/
RUN chmod -R 777 /var/log/mysql 

EXPOSE	3306

ENTRYPOINT ["/usr/local/bin/init_mysql.sh"]

CMD ["mysqld", "--bind-address=0.0.0.0", "--port=3306", "--log-error=/var/lib/mysql/error.log"]
