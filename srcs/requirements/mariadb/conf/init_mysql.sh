#!/bin/bash
service mysql start
sleep 6
echo "CREATE DATABASE IF NOT EXISTS $DB_NAME DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci" | mysql -u root
echo "CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_PASS'" | mysql -u root
echo "GRANT ALL ON $DB_NAME .* TO '$DB_USER'@'%'" | mysql -u root
echo "FLUSH PRIVILEGES;" | mysql -u root

service mysql stop
mysqld --user=root
