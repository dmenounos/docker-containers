#!/bin/bash

IMAGE="dmen/pbs:3.0.0"
CONTAINER="pbs"

case $1 in
run)
	PWD=$(pwd)
	VOLUMES="-v $PWD:/mnt/work"
	EXTRAS+="-v /tmp/.X11-unix:/tmp/.X11-unix "
	EXTRAS+="-e QT_X11_NO_MITSHM=1 "
	EXTRAS+="-e DISPLAY=$DISPLAY "
	(set -x; docker container run -it -d --rm \
	$VOLUMES \
	$EXTRAS \
	-u $(id -u):$(id -g) \
	--entrypoint /opt/KJPBS/raw/opt/kjvpurebiblesearch/KJVCanOpener/app/KingJamesPureBibleSearch \
	--name $CONTAINER \
	$IMAGE)
	;;
init)
	PWD=$(pwd)
	VOLUMES="-v $PWD:/mnt/work"
	EXTRAS+="-v /tmp/.X11-unix:/tmp/.X11-unix "
	EXTRAS+="-e QT_X11_NO_MITSHM=1 "
	EXTRAS+="-e DISPLAY=$DISPLAY "
	(set -x; docker container run -it -d --rm \
	$VOLUMES \
	$EXTRAS \
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
		echo "Log as the root:"
		echo "docker container exec -it $CONTAINER bash -l"
		echo
		echo "Log as any user:"
		echo "docker container exec -it -u \$(id -u):\$(id -g) $CONTAINER bash -l"
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
