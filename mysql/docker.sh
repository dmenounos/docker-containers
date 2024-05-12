#!/bin/bash

IMAGE="dmen/mysql:5.5"
CONTAINER="test-mysql"

# Parameters for the initialization of the container
MYSQL_USERNAME="my_db"
MYSQL_PASSWORD="my_db"
MYSQL_DATABASE="my_db"

case $1 in
init)
	docker container run -d -it \
	--env MYSQL_USERNAME="$MYSQL_USERNAME" \
	--env MYSQL_PASSWORD="$MYSQL_PASSWORD" \
	--env MYSQL_DATABASE="$MYSQL_DATABASE" \
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
		echo
		echo "Log as user:"
		echo "$0 exec su -l mysql -s /bin/bash"
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
	echo 1>&2
	echo "Usage: $0 { init | start | stop | rm | logs | exec | ip }" 1>&2
	echo 1>&2
	exit 1
	;;
esac
