#!/bin/bash

IMAGE="dmen/denv:20"
CONTAINER="test-denv"

# Parameters for the initialization of the container
USER_GROUP_NAME="user"
USER_GROUP_ID=$(id -g)
USER_NAME="user"
USER_ID=$(id -u)

case $1 in
init)
	docker container run -d -it \
	-v $(pwd):/mnt/work \
	--env USER_GROUP_NAME="$USER_GROUP_NAME" \
	--env USER_GROUP_ID="$USER_GROUP_ID" \
	--env USER_NAME="$USER_NAME" \
	--env USER_ID="$USER_ID" \
	--name $CONTAINER \
	$IMAGE
	;;
start)
	docker container start $CONTAINER
	;;
stop)
	docker container stop $CONTAINER
	;;
rm)
	docker container rm $CONTAINER
	;;
logs)
	docker container logs $CONTAINER
	;;
exec)
	if ([ "$#" -eq "1" ]); then
		echo
		echo "Run a command as root:"
		echo "$0 exec bash -l"
		echo "$0 exec bash -l -c \"node -v\""
		echo "$0 exec bash -l -c \"java -version\""
		echo
		echo "Log as user:"
		echo "$0 exec su -l user"
		echo
		exit 1
	fi

	shift
	docker container exec -it $CONTAINER "$@"
	;;
ip)
	docker container inspect $CONTAINER | grep IPAddress | grep -v null | head -1 | cut -d '"' -f 4
	;;
*)
	echo >&2
	echo "Usage: $0 { init | start | stop | rm | logs | exec | ip }" >&2
	echo >&2
	exit 1
	;;
esac
