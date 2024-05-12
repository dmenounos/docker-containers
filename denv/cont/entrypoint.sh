#!/bin/bash

if [ -f "/tmp/initialize.sh" ]; then
	cd /tmp && ./initialize.sh
fi

exec "$@"
