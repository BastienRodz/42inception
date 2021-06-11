# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    init_mariadb.sh                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: barodrig <barodrig@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/02/10 12:07:34 by barodrig          #+#    #+#              #
#    Updated: 2021/06/11 11:28:28 by barodrig         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

service mysql start

#Configuring wordpress database
echo "CREATE DATABASE wordpress;" | mysql -u root --skip-password
echo "GRANT ALL PRIVILEGES ON wordpress.* TO 'root'@'localhost' WITH GRANT OPTION;" | mysql -u root --skip-password
echo "update mysql.user set plugin='mysql_native_password' where user='root';" | mysql -u root --skip-password
echo "FLUSH PRIVILEGES;" | mysql -u root --skip-password

bash
