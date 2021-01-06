#!/bin/bash

service mysql start

if ([ -f "/tmp/initialize.sh" ]); then
	cd /tmp && ./initialize.sh
fi

exec "$@"
