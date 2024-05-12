#!/bin/bash

source /etc/profile.d/mysql_home.sh

echo "Deleting anonymous and hostname specific users"

INSTALL_HOSTNAME=$(cat ./mysql/install_hostname.txt)

echo "DROP USER ''@'localhost';" | mysql -h localhost -u root 
echo "DROP USER ''@'$INSTALL_HOSTNAME';" | mysql -h localhost -u root 
echo "DROP USER 'root'@'$INSTALL_HOSTNAME';" | mysql -h localhost -u root 
