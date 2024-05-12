#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://downloads.mysql.com/archives/get/p/23/file/mysql-5.5.27-linux2.6-x86_64.tar.gz"

ARCHIVE="mysql-5.5.27-linux2.6-x86_64.tar.gz"
ARCHDIR="mysql-5.5.27-linux2.6-x86_64"

HOMEDIR="mysql-5.5.27"
HOMELNK="mysql"

HOMEVAR="MYSQL_HOME"
HOMEBIN="/bin"

main "$@"

if [ "$USER" == "root" ]; then
	echo "[server]"                                          > /etc/my.cnf
	echo "basedir = $INSTALL_DIR"                           >> /etc/my.cnf
	echo "datadir = /var/lib/mysql"                         >> /etc/my.cnf
	echo "character-sets-dir = $INSTALL_DIR/share/charsets" >> /etc/my.cnf
	echo "character-set-server = utf8"                      >> /etc/my.cnf
	echo "user = mysql"                                     >> /etc/my.cnf
	echo "port = 3306"                                      >> /etc/my.cnf
	echo "socket = /var/run/mysqld/mysqld.sock"             >> /etc/my.cnf
	echo "pid-file = /var/run/mysqld/mysqld.pid"            >> /etc/my.cnf
	echo "bind-address = 0.0.0.0"                           >> /etc/my.cnf
	echo "skip-name-resolve"                                >> /etc/my.cnf
	echo                                                    >> /etc/my.cnf
	echo "[client]"                                         >> /etc/my.cnf
	echo "default-character-set = utf8"                     >> /etc/my.cnf
	echo "port = 3306"                                      >> /etc/my.cnf
	echo "socket = /var/run/mysqld/mysqld.sock"             >> /etc/my.cnf

	if [ ! -d "/etc/mysql" ]; then
		mkdir /etc/mysql
	fi

	if [ -f "/etc/mysql/my.cnf" ]; then
		mv /etc/mysql/my.cnf /etc/mysql/my.cnf.bak
	fi

	ln -s /etc/my.cnf /etc/mysql/my.cnf

	groupadd -r mysql
	useradd -r -m -g mysql mysql

	# take ownership of everything
	chown -R mysql:mysql $INSTALL_DIR
	chown -R mysql:mysql $INSTALL_LNK

	# install as a service
	cp $INSTALL_DIR/support-files/mysql.server /etc/init.d/mysql
	chmod +x /etc/init.d/mysql

	# post install initialization
	if [ ! -d "/var/lib/mysql" ]; then
		mkdir -p /var/lib/mysql
		chown -R mysql:mysql /var/lib/mysql
	fi

	if [ ! -d "/var/run/mysqld" ]; then
		mkdir -p /var/run/mysqld
		chown -R mysql:mysql /var/run/mysqld
	fi

	$INSTALL_DIR/scripts/mysql_install_db --user=mysql \
	--basedir=$INSTALL_DIR --datadir=/var/lib/mysql

	echo $(hostname) > install_hostname.txt
fi
