# Description

PostgreSQL

A database

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
   podman kube play postgresql-pvc.yaml
   # podman kube play postgresql-secret.yaml # TODO WORKAROUND FOR https://github.com/containers/podman/issues/16269
   podman secret create postgresql-secret postgresql-secret.json
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/postgresql-pod.yaml).service
   ```
3. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)

### Upgrade instructions

https://www.postgresql.org/docs/current/upgrading.html
