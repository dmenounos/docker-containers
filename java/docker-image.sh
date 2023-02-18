#!/bin/bash

IMAGE="dmen/java:11"

case $1 in
create)
	docker image build -t $IMAGE .
	;;
remove)
	docker image rm $IMAGE
	;;
*)
	echo 1>&2
	echo "Usage: $0 { create | remove }" 1>&2
	echo 1>&2
	exit 1
	;;
esac
