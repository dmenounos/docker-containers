#!/bin/sh

cd $WILDFLY_HOME/bin && ./jboss-cli.sh \
	--connect --command=shutdown
