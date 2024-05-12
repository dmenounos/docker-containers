#!/bin/bash

if [ -n "$WILDFLY_USERNAME" ]; then
	echo "Creating user $WILDFLY_USERNAME"
	su -l wildfly -s /bin/bash \
	-c "cd \$WILDFLY_HOME/bin && ./add-user.sh \"$WILDFLY_USERNAME\" \"$WILDFLY_PASSWORD\""
fi
