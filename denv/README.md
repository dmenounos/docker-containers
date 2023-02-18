# Development Environment image for Docker

A debian based image for docker that contains the following major tools:

* GCC, CMake, Autotools (OS packages)
* Java, Ant, Maven
* Node

At the root directory there are two script files that will help you with the handling of the image and the container.

**docker-image.sh** -- Create and Remove image

> ./docker-image.sh 
> 
> Usage: ./docker-image.sh { create | remove }

**docker.sh** -- Initialize, Start, Stop, Remove container, Show logs, Execute command, Inspect IP of container

> ./docker.sh 
> 
> Usage: ./docker.sh { init | start | stop | rm | logs | exec | ip }
