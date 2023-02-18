#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.62/bin/apache-tomcat-9.0.62.tar.gz"

ARCHIVE="apache-tomcat-9.0.62.tar.gz"
ARCHDIR="apache-tomcat-9.0.62"

HOMEDIR="tomcat-9.0.62"
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
