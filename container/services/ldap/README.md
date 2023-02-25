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
   podman kube play ldap-secret.yaml
   cp ldap-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start ldap-pod.service
   ```
3. Wait until the container logs show `INFO: 389-ds-container started.` on the first startup.
   This may take a while.
   Do not wait until `DEBUG:  🎉 Instance setup complete`, which is too early.
4. Configuration inside pod
   ```bash
   dsconf --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost backend create --be-name userRoot --suffix ${DS_SUFFIX_NAME}
   dsidm --basedn ${DS_SUFFIX_NAME} --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost initialise
   ```
5. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)
