#!/bin/bash

IMAGE="dmen/wildfly:10.1"
CONTAINER="wildfly-test"

# Parameters for the initialization of the container
WILDFLY_USERNAME="wildfly"
WILDFLY_PASSWORD="wildfly"

case $1 in
init)
	(set -x; docker container run -d -it \
	--env WILDFLY_USERNAME="$WILDFLY_USERNAME" \
	--env WILDFLY_PASSWORD="$WILDFLY_PASSWORD" \
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
		echo
		echo "Log as user:"
		echo "$0 exec su -l wildfly -s /bin/bash"
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
