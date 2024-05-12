FROM debian:buster

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y vim nano zip unzip xz-utils net-tools \
 && apt install -y ca-certificates curl

# Install program files

COPY ./cont/tmp /tmp
