# Description
Creating and using a docker-compose server

## Table of contents
1. Base
    1. [Arch Linux Server](base-arch-linux/README.md)
1. Docker-Compose services
    1. `docker network create nginx-certbot_default`  
        Automatically created by the HTTPS step and will be used by the other containers.  
        But since we need to have the other services up before running the HTTPS container  
        and these containers need the network, we need to create it first.
    1. [Postgresql Database](db-postgresql/README.md)
    1. [Camunda BPM Platform](camunda-bpm-platform/README.md)
    1. [HTTPS](https/README.md)
