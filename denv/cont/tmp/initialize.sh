#!/bin/bash

# Execute default initialization scripts

if [ -d init ]; then
	for file in init/*.sh; do
		echo "$file"
		$file
	done
fi

# Execute extension initialization scripts

if [ -d init-ext ]; then
	for file in init-ext/*.sh; do
		echo "$file"
		$file
	done
fi

chmod -x "$0"
mv "$0" "$(basename ${0%.*}).done"
