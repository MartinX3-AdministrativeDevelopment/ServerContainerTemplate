# Description

SMTP Notification Service

An SMTP gateway for Apprise notifications.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [HTTPS](../dynds-https-ip/README.md)

### Installation instructions

1. Follow the docs of
    - [mailrise](https://github.com/YoRyan/mailrise)
    - [apprise](https://github.com/caronc/apprise)
2. Start the pod
   ```bash
   cp smtp-gateway-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start smtp-gateway-pod.service
   ```
3. Open the firewall
   ```bash
   firewall-cmd --zone=trusted --add-service=smtp --permanent # only localhost access
   firewall-cmd --reload
   ```
