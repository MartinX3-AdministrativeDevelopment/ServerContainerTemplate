# Description

Creating and using a docker-compose server

## Table of contents

1. Base
    1. Operating System
        - [Arch Linux Server](base/operating-system/linux/arch/README.md)
        - [Alpine Linux Server](base/operating-system/linux/alpine/README.md)
    1. [Further Steps](base/further-steps/README.md)
1. Docker-Compose services
    1. `docker network create nginx-certbot_default`  
       Automatically created by the HTTPS step and will be used by the other containers.  
       Since we need to have the other services up before running the HTTPS container, these containers need the
       network, we need to create it first.
    1. [Postgresql Database](docker-container/services/db-postgresql/README.md)
    1. [Camunda BPM Platform](docker-container/services/camunda-bpm-platform/README.md)
    1. [Gitlab](docker-container/services/gitlab/README.md)
    1. [HTTPS](docker-container/services/https/README.md)
