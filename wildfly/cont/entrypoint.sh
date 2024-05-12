#!/bin/bash

if [ -f "/tmp/initialize.sh" ]; then
	cd /tmp && ./initialize.sh
fi

service wildfly start

exec "$@"
