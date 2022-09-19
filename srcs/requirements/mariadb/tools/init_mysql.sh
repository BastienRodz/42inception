#!/bin/sh

# Checking if the db exists
if [ -d "/var/lib/mysql/$MYSQL_DATABASE" ]
then 
	/usr/share/mysql/mysql.server start
	echo "Database exists - Nothing to be done"
else
	mysql_install_db
	/usr/share/mysql/mysql.server start
#Add a root user on 127.0.0.1 to allow remote connexion

	mysql -uroot -e "GRANT ALL ON *.* TO 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD'; FLUSH PRIVILEGES;"
	echo "\n ----- Privilegies granted and flushed ----- \n"

#Create database and user for wordpress
	mysql -uroot -p$MYSQL_ROOT_PASSWORD -e "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE; GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USER'@'%' IDENTIFIED BY '$MYSQL_PASSWORD'; FLUSH PRIVILEGES;"
	echo "\n ----- Database configured -----\n"

#Import database
mysql -uroot -p$MYSQL_ROOT_PASSWORD $MYSQL_DATABASE < /usr/local/bin/wordpress.sql

fi
/usr/share/mysql/mysql.server stop

$@
