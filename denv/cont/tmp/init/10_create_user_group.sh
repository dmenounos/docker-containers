#!/bin/bash

# Create user group when appropriate.

if [ -n "$USER_GROUP_NAME" ]; then
	USER_GROUP_OPT=""

	if [ -n "$USER_GROUP_ID" ]; then
		USER_GROUP_OPT="$USER_GROUP_OPT --gid $USER_GROUP_ID"
	fi

	USER_GROUP_CMD="groupadd $USER_GROUP_OPT $USER_GROUP_NAME"
	echo $USER_GROUP_CMD
	eval $USER_GROUP_CMD
fi

# Create user when appropriate.

if [ -n "$USER_NAME" ]; then
	USER_OPT="-m -s /bin/bash"

	if [ -n "$USER_GROUP_NAME" ]; then
		USER_OPT="$USER_OPT -g $USER_GROUP_NAME"
	fi

	if [ -n "$USER_ID" ]; then
		USER_OPT="$USER_OPT --uid $USER_ID"
	fi

	USER_CMD="useradd $USER_OPT $USER_NAME"
	echo $USER_CMD
	eval $USER_CMD
fi
