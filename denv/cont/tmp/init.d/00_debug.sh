#!/bin/bash

# Print environment variables

(set -x; env | sort)

# Print user and group

(set -x; id)
