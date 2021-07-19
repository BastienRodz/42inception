#!/bin/bash
service mysql start
sleep 6
echo "CREATE DATABASE IF NOT EXISTS $MARIA_DATABASE DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$MARIA_LOGIN'@'%' IDENTIFIED BY '$MARIA_PASS'" | mysql -u root
echo "GRANT ALL ON $MARIA_DATABASE .* TO '$MARIA_USER'@'%'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service mysql stop
./usr/bin/mysqld_safe
