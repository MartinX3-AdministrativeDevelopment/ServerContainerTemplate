# Description

A LDAP server using 389 DS

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [Server](../../../base/operating-system)

### Installation instructions

1. Follow the docs of
    - [389 DS](https://directory.fedoraproject.org/)
    - https://hub.docker.com/r/389ds/dirsrv
2. Start the pod
   ```bash
   podman kube play ldap-pvc.yaml
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/ldap-pod.yaml).service
   ```
3. Configuration inside pod
   ```bash
   dsconf localhost backend create --be-name userRoot --suffix dc=exploding-hamster,dc=duckdns.org
   dsidm -b dc=exploding-hamster,dc=duckdns.org localhost initialise
   ```
4. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)
