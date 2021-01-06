#!/bin/bash

service tomcat start

exec "$@"
