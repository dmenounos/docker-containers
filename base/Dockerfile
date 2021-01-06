FROM debian:buster

# Install OS packages

RUN apt update \
 && export DEBIAN_FRONTEND=noninteractive \
 && apt install -y zip unzip xz-utils nano vim \
 && apt install -y ca-certificates curl \
 && apt install -y net-tools

# Install program files

COPY ./cont/tmp /tmp
