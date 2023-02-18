# Tomcat image for Docker

A debian based image for docker that contains the Tomcat server.

Requires the [dmen/java:08](https://github.com/dmenounos/docker-containers) image. So get and build that if you don't already have it.

At the root directory there are two script files that will help you with the handling of the image and the container.

**docker-image.sh** -- Create and Remove image

> ./docker-image.sh 
> 
> Usage: ./docker-image.sh { create | remove }

**docker.sh** -- Initialize, Start, Stop, Remove container, Show logs, Execute command, Inspect IP of container

> ./docker.sh 
> 
> Usage: ./docker.sh { init | start | stop | rm | logs | exec | ip }
