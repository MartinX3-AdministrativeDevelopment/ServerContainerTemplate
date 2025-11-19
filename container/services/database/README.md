# Description

PostgreSQL database server

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)
3. [Upgrade instructions](#upgrade-instructions)

### Service requirements

- [LDAP](../ldap/README.md)

### Installation instructions

1. Follow the [docs](https://www.postgresql.org/docs/current/app-initdb.html)
2. Start the pod
   ```bash
   podman kube play postgresql-pvc.yaml postgresql-secret.yaml
   cp postgresql-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start postgresql-pod.service
   ```
3. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)

### Upgrade instructions

https://www.postgresql.org/docs/current/upgrading.html
