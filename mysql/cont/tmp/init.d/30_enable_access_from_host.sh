#!/bin/bash

source /etc/profile.d/mysql_home.sh

echo "Enabling access to docker machine from host"

echo "CREATE USER 'root'@'%' IDENTIFIED BY '$MYSQL_ROOT_PASSWORD';" | mysql -h localhost -u root 
echo "GRANT ALL ON *.* TO 'root'@'%' WITH GRANT OPTION;" | mysql -h localhost -u root 

echo "FLUSH PRIVILEGES;" | mysql -h localhost -u root 
