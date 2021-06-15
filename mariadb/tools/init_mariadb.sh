# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_mariadb.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 12:07:34 by barodrig          #+#    #+#              #
#    Updated: 2021/06/15 14:50:56 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service mysql start

mysql -u root -e "CREATE DATABASE ${MARIA_DATABASE}"
mysql -u root -e "CREATE USER ${MARIA_LOGIN}@'42inception' IDENTIFIED BY ${MARIA_PASS}"
mysql -u root -e "GRANT ALL PRIVILEGES ON ${MYSQL_DATABASE} TO ${MARIA_LOGIN}@'42inception' IDENTIFIED BY ${MARIA_PASS}"
mysql -u root -e "GRANT ALL PRIVILEGES ON *.* TO ${MARIA_LOGIN}@'42inception' IDENTIFIED BY ${MARIA_PASS}"
mysql -u root -e "FLUSH PRIVILEGES"
mysql -u root -p ${MARIA_PASS} ${MARIA_DATABASE} #< /tmp/wp_database.sql

exec mysqld_safe --datadir="var/lib/mysql"
