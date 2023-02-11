# Description

Borg Backup Server

Deduplicating archiver with compression and authenticated encryption.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [DNS](../../../../container/services/dynds-https-ip/README.md)

### Installation instructions

1. Follow the docs of the
    - [Dockerimage](https://hub.docker.com/r/tgbyte/borg-backup)
    - [Borg backup](https://borgbackup.readthedocs.io/en/stable/)
2. Start the pod
   ```bash
   podman kube play borg-backup-server-pvc.yaml
   podman kube play borg-backup-server-secret.yaml
   cp borg-backup-server-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start borg-backup-server-pod.service
   ```
3. Install files
    1. Host -> [borg-backup-server.xml](borg-backup-server.xml)
4. Open the firewall
   ```bash
   firewall-cmd --zone=public --add-service=borg-backup-server --permanent
   firewall-cmd --reload
   ```
