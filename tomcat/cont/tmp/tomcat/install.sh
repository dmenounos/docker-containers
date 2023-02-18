#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://archive.apache.org/dist/tomcat/tomcat-8/v8.5.15/bin/apache-tomcat-8.5.15.tar.gz"

ARCHIVE="apache-tomcat-8.5.15.tar.gz"
ARCHDIR="apache-tomcat-8.5.15"

HOMEDIR="tomcat-8.5.15"
HOMELNK="tomcat"

HOMEVAR="CATALINA_HOME"
HOMEBIN="/bin"

main "$@"

cp tomcat-start.sh $INSTALL_DIR/bin
cp tomcat-stop.sh $INSTALL_DIR/bin

if [ "$USER" == "root" ]; then
	groupadd -r tomcat
	useradd -r -m -g tomcat tomcat

	# take ownership of everything
	chown -R tomcat:tomcat $INSTALL_DIR
	chown -R tomcat:tomcat $INSTALL_LNK

	# install as a service
	cp tomcat.init /etc/init.d/tomcat
	chmod +x /etc/init.d/tomcat
fi
