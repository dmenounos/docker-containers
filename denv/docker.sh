#!/bin/bash

IMAGE="dmen/denv:21"
CONTAINER="denv-test"

# Parameters for the initialization of the container
GROUP_NAME="user"
GROUP_ID=$(id -g)
USER_NAME="user"
USER_ID=$(id -u)

case $1 in
init)
	PWD=$(pwd)
	if [[ "$OSTYPE" =~ ^msys.* ]]; then
		# On windows, replace /c/ with C:/
		PWD=$(echo "$PWD" | sed -n "s|^/c/|C:/|p")
	fi
	if [[ "$OSTYPE" =~ ^linux.* ]]; then
		# On linux, add host support for Docker and X
		EXTRAS+="-v /var/run/docker.sock:/var/run/docker.sock "
		EXTRAS+="-v /tmp/.X11-unix:/tmp/.X11-unix "
		EXTRAS+="-e DISPLAY=\"$DISPLAY\" "
	fi
	PORTS+=" "
	(set -x; docker container run -d -it \
	-e GROUP_NAME="$GROUP_NAME" \
	-e GROUP_ID="$GROUP_ID" \
	-e USER_NAME="$USER_NAME" \
	-e USER_ID="$USER_ID" \
	-v $PWD:/mnt/work \
	$EXTRAS \
	$PORTS \
	--name $CONTAINER \
	$IMAGE)
	;;
start)
	(set -x; docker container start $CONTAINER)
	;;
stop)
	(set -x; docker container stop $CONTAINER)
	;;
rm)
	(set -x; docker container rm $CONTAINER)
	;;
logs)
	(set -x; docker container logs $CONTAINER)
	;;
exec)
	if [ "$#" -eq "1" ]; then
		echo
		echo "Run commands as root:"
		echo "$0 exec bash -l -c \"java -version\""
		echo "$0 exec bash -l -c \"node -v\""
		echo
		echo "Log as the root:"
		echo "$0 exec bash -l"
		echo "docker container exec -it $CONTAINER bash -l"
		echo
		echo "Log as the user:"
		echo "$0 exec su -l user"
		echo "docker container exec -it $CONTAINER su -l user"
		echo
		echo "Log as any user:"
		echo "docker container exec -it -u 1000:1000 $CONTAINER bash -l"
		echo "docker container exec -it -u \$(id -u):\$(id -g) $CONTAINER bash -l"
		echo
		exit 1
	fi

	shift
	DOCKER="docker"
	if [[ "$OSTYPE" =~ ^msys.* ]]; then
		# On windows, executions that include interactive terminal need winpty
		DOCKER="winpty $DOCKER"
	fi
	(set -x; $DOCKER container exec -it $CONTAINER "$@")
	;;
ip)
	(set -x; docker container inspect $CONTAINER | grep IPAddress | grep -v null | head -1 | cut -d '"' -f 4)
	;;
*)
	echo 1>&2
	echo "Usage: $0 { init | start | stop | rm | logs | exec | ip }" 1>&2
	echo 1>&2
	exit 1
	;;
esac
