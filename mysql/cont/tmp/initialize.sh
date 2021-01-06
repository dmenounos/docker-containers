#!/bin/bash

source /etc/profile.d/mysql_home.sh

# Execute default initialization scripts

if [ -d init ]; then
	for file in init/*.sh; do
		echo "$file"
		$file
	done
fi

# Execute extension initialization sql scripts

if [ -d init-ext ]; then
	for file in init-ext/*.sql; do
		echo "$file"
		mysql -h localhost -u root < $file
	done
fi

chmod -x "$0"
mv "$0" "$(basename ${0%.*}).done"
