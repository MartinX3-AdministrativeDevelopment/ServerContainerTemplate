# Description

Borg Backup Server

Deduplicating archiver with compression and authenticated encryption.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [Server](../../../../base/operating-system)

### Installation instructions

1. Follow the docs of the
    - [Dockerimage](https://hub.docker.com/r/tgbyte/borg-backup)
    - [Borg backup](https://borgbackup.readthedocs.io/en/stable/)
2. Start the pod
   ```bash
   podman kube play borg-backup-server-pvc.yaml
   # podman kube play borg-backup-server-secret.yaml # TODO WORKAROUND FOR https://github.com/containers/podman/issues/16269
   podman secret create borg-backup-server-secret borg-backup-server-secret.json
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/borg-backup-server-pod.yaml).service
   ```
3. Install files
    1. Host -> [borg-backup-server.xml](borg-backup-server.xml)
4. Open the firewall
   ```bash
   firewall-cmd --zone=public --add-service=borg-backup-server --permanent
   firewall-cmd --reload
   ```
