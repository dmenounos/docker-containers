#!/bin/bash

# Create user group when appropriate

if [ -n "$GROUP_NAME" ]; then
	GROUP_OPT=""

	if [ -n "$GROUP_ID" ]; then
		GROUP_OPT="$GROUP_OPT --gid $GROUP_ID"
	fi

	GROUP_CMD="groupadd $GROUP_OPT $GROUP_NAME"
	echo "$GROUP_CMD"
	eval "$GROUP_CMD"
fi

# Create user when appropriate

if [ -n "$USER_NAME" ]; then
	USER_OPT="-m -s /bin/bash"

	if [ -n "$GROUP_NAME" ]; then
		USER_OPT="$USER_OPT -g $GROUP_NAME"
	fi

	if [ -n "$USER_ID" ]; then
		USER_OPT="$USER_OPT --uid $USER_ID"
	fi

	USER_CMD="useradd $USER_OPT $USER_NAME"
	echo "$USER_CMD"
	eval "$USER_CMD"
fi
