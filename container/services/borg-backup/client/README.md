# Description

Borg Backup Client

Deduplicating archiver with compression and authenticated encryption.

Not existing volumes will get created, but stay empty.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [Borg Backup Server](../server/README.md)

### Installation instructions

1. Follow the docs of the
    - [Dockerimage](https://github.com/borgmatic-collective/docker-borgmatic)
    - [Borgmatic](https://torsion.org/borgmatic/)
2. Start the pod
   ```bash
   podman kube play borg-backup-client-pvc.yaml
   # podman kube play borg-backup-client-secret.yaml # TODO WORKAROUND FOR https://github.com/containers/podman/issues/16269
   podman secret create borg-backup-client-secret borg-backup-client-secret.json
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/borg-backup-client-pod.yaml).service
   ```
3. Inside the pod
   ```bash
   ssh-keygen -t ed25519 -C "exploding-hamster@exploding-hamster.duckdns.org"
   ```
4. Borg Server
    1. `borg init --encryption=repokey-blake2 /var/backups/borg/exploding-hamster.duckdns.org`
    2. `borg key export /var/backups/borg/exploding-hamster.duckdns.org`
    3. Add the client ssh key in `/root/.ssh` to the container secret of the borg-backup-server
5. [Configure the mail notification inside the pod](msmtp.env)
6. Inside the pod add to the `/etc/borgmatic.d/config.yaml` your repo
    - Example: `ssh://borg@exploding-hamster.duckdns.org:26351/var/backups/borg/exploding-hamster.duckdns.org`
7. Restart the pod