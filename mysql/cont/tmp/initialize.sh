#!/bin/bash

source /etc/profile.d/mysql_home.sh

# Execute embedded initialization scripts

if [ -d "init.d" ]; then
	for file in "init.d"/*.sh; do
		echo "$file"
		$file
	done
fi

# Execute extended initialization scripts

if [ -d "init-ext.d" ]; then
	for file in "init-ext.d"/*.sql; do
		echo "$file"
		mysql -h localhost -u root < $file
	done
fi

# Disable self

chmod -x "$0"
mv "$0" "${0%.*}.done"
