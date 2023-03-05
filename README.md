# Description

Creating and using a podman server

## Table of contents

1. [Requirements](#requirements)
2. Base
    1. Operating System
        - [Arch Linux Server](base/operating-system/linux/arch/README.md)
        - [Alpine Linux Server](base/operating-system/linux/alpine/README.md)
    2. [IPMI](base/IPMI.md)
    3. [Further Steps](base/further-steps/README.md)
3. Podman services
    1. Borg Backup
        1. [Client](container/services/borg-backup/client/README.md)
        2. [Server](container/services/borg-backup/server/README.md)
    2. [CI](container/services/ci/README.md)
    3. [DYNDNS HTTPS IP](container/services/dynds-https-ip/README.md)
    4. [E-Mail SMTP Notification](container/services/notification/README.md)
    5. Honeypot
        1. [SSH](container/services/honeypot/ssh/README.md)
    6. [LDAP](container/services/ldap/README.md)
    7. [Nextcloud](container/services/nextcloud/README.md)
    8. [Postgresql Database](container/services/database/README.md)
4. Podman maintenance services
    1. N/A

## Requirements

1. ```bash
    sudo mkdir -p /opt/podman/ServerContainerTemplate
    sudo chown user:group -R /opt/podman/ServerContainerTemplate
    git clone https://github.com/MartinX3-AdministrativeDevelopment/ServerContainerTemplate.git /opt/podman/ServerContainerTemplate
    ```
2. Add your changes
