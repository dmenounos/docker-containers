#!/bin/sh

BIND_ADDRESS="0.0.0.0"
PORT_OFFSET="0"

cd $WILDFLY_HOME/bin && ./standalone.sh \
	-Djboss.bind.address=$BIND_ADDRESS \
	-Djboss.bind.address.management=$BIND_ADDRESS \
	-Djboss.socket.binding.port-offset=$PORT_OFFSET
