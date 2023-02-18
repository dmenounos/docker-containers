#!/bin/bash

set -e
source "../install.in"

ARCHURL="https://download.jboss.org/wildfly/10.1.0.Final/wildfly-10.1.0.Final.tar.gz"

ARCHIVE="wildfly-10.1.0.Final.tar.gz"
ARCHDIR="wildfly-10.1.0.Final"

HOMEDIR="wildfly-10.1.0"
HOMELNK="wildfly"

HOMEVAR="WILDFLY_HOME"
HOMEBIN="/bin"

main "$@"

cp wildfly-start.sh $INSTALL_DIR/bin
cp wildfly-stop.sh $INSTALL_DIR/bin

if [ "$USER" == "root" ]; then
	groupadd -r wildfly
	useradd -r -m -g wildfly wildfly

	# take ownership of everything
	chown -R wildfly:wildfly $INSTALL_DIR
	chown -R wildfly:wildfly $INSTALL_LNK

	# install as a service
	cp wildfly.init /etc/init.d/wildfly
	chmod +x /etc/init.d/wildfly
fi
