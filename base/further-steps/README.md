# Description

Universal maintenance tips

## Table of contents

1. [Installation instructions](#installation-instructions)
    1. [SSH](#ssh)
    1. [DynDNS](#dyndns)
    1. [Podman](#podman)
    1. [Podman Compose](#podman-compose)
    1. [Docker Compose](#docker-compose)
1. [Maintenance Tips](#maintenance-tips)
1. [Security Tips](#security-tips)

### Installation instructions

#### SSH

- OpenSSH
- Secure_Shell

#### DynDNS

1. [Example free DynDNS service](https://freedns.afraid.org/)
1. [Updater for the dyndns service](examples/dyndns)

#### Podman

Successor of docker. Compatible to docker. Better security. Designed to run rootless.
Has a docker API layer with the podman-docker package.

- [Installation](https://podman.io/)
- [Podman Rootless](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md)
- `systemctl --user enable podman.socket --now`

#### Podman Compose

Docker compose replacement for podman.

- [Installation](https://github.com/containers/podman-compose)

#### Docker Compose

Podman is compatible to it. use it only if you get problems with podman compose.

- [Installation](https://docs.docker.com/compose/)
- [Installation Rootless (Security)](https://docs.docker.com/engine/security/rootless/)
- Environmental variable `DOCKER_HOST=unix:///run/user/1000/podman/podman.sock`

### Maintenance Tips

1. Bash autocompletion
1. [Prune unused dockerimages/-tags to free up disk space](examples/podman/prune)
1. Displaying information & updatable packages on (ssh) login
    1. [Example motd generation files.](examples/motd)
        1. Needs package `lm_sensors`
1. [Displaying open updates on a dashboard for your servers](https://github.com/furlongm/patchman)
1. [Monitoring server health](https://github.com/mikaku/Monitorix)

#### Security Tips

1. [Podman.io](https://podman.io/)
1. [Podman.io - Tutorials](https://docs.podman.io/en/latest/Tutorials.html)
1. [Podman.io - Documentation](https://docs.podman.io/en/latest/)
1. [Docker Wiki](https://docs.docker.com/)
1. [Docker Security](https://docs.docker.com/engine/security/)
1. [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)
1. [Generate SSL config](https://ssl-config.mozilla.org/)
1. [Test Website security](https://www.ssllabs.com/ssltest/)
