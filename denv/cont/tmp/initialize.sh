#!/bin/bash

# Execute embedded initialization scripts

if [ -d "init.d" ]; then
	for file in "init.d"/*.sh; do
		echo -e "\nExecuting: $file"
		$file
	done
fi

# Execute extended initialization scripts

if [ -d "init-ext.d" ]; then
	for file in "init-ext.d"/*.sh; do
		echo -e "\nExecuting: $file"
		$file
	done
fi

# Disable self

chmod -x "$0"
mv "$0" "${0%.*}.done"
