#!/bin/bash

source /etc/profile.d/mysql_home.sh

if ([ -n "$MYSQL_DATABASE" ]); then
	echo "Creating custom database $MYSQL_DATABASE"
	echo "CREATE DATABASE IF NOT EXISTS $MYSQL_DATABASE;" | mysql -h localhost -u root 
fi

if ([ -n "$MYSQL_USERNAME" ]); then
	echo "Creating custom user $MYSQL_USERNAME"
	echo "CREATE USER '$MYSQL_USERNAME'@'%' IDENTIFIED BY '$MYSQL_PASSWORD';" | mysql -h localhost -u root 

	if ([ -n "$MYSQL_DATABASE" ]); then
		echo "GRANT ALL ON $MYSQL_DATABASE.* TO '$MYSQL_USERNAME'@'%';" | mysql -h localhost -u root 
	fi
fi
