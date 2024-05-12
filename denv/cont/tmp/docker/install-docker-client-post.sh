#!/bin/bash

set -e

# Post-installation steps for Linux
# https://docs.docker.com/engine/install/linux-postinstall/

if [ -S /var/run/docker.sock ]; then
	echo "We have a docker socket file mounted from the host."
	DOCKER_GROUP=$(ls -la /var/run/docker.sock | cut -d ' ' -f 4)
	echo "Creating group for docker with ID: $DOCKER_GROUP"
	groupadd --gid $DOCKER_GROUP docker

	if [ -n "$USER_NAME" ]; then
		echo "We have a user configured from the host."
		echo "Adding $USER_NAME to the group of docker."
		usermod -aG docker $USER_NAME
	fi
fi
