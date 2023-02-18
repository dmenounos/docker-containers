#!/bin/bash

IMAGE="dmen/denv:18"
CONTAINER="denv-test"

# Parameters for the initialization of the container
USER_GROUP_NAME="user"
USER_GROUP_ID=$(id -g)
USER_NAME="user"
USER_ID=$(id -u)

case $1 in
init)
	(set -x; docker container run -d -it --rm \
	-e USER_GROUP_NAME="$USER_GROUP_NAME" \
	-e USER_GROUP_ID="$USER_GROUP_ID" \
	-e USER_NAME="$USER_NAME" \
	-e USER_ID="$USER_ID" \
	-v $(pwd):/mnt/work \
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
		echo "Run a command as root:"
		echo "$0 exec bash -l"
		echo "$0 exec bash -l -c \"node -v\""
		echo "$0 exec bash -l -c \"java -version\""
		echo
		echo "Log as the user:"
		echo "$0 exec su -l user"
		echo
		echo "Log as any user:"
		echo "docker container exec -it -u \$(id -u):\$(id -g) $CONTAINER bash"
		echo
		exit 1
	fi

	shift
	(set -x; docker container exec -it $CONTAINER "$@")
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
