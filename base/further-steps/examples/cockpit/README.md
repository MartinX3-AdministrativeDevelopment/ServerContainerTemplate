# Description

Cockpit is a web-based graphical interface for servers.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [HTTPS](../../../../container/services/dynds-https-ip/README.md)

### Installation instructions

1. [Podman](https://wiki.archlinux.org/title/Cockpit)
2. ```bash
   firewall-cmd --zone=public --add-service=cockpit --permanent
   firewall-cmd --reload
   ```
3. Install files
    1. https container -> [cockpit.subdomain.conf](cockpit.subdomain.conf)
4. Restart https container
5. ```bash
   systemctl enable --now cockpit.socket
   ```