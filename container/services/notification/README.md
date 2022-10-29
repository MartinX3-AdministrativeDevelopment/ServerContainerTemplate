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
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/smtp-gateway-pod.yaml).service
   ```
3. Open the firewall
   ```bash
   firewall-cmd --zone=trusted --add-service=smtp --permanent # only localhost access
   firewall-cmd --reload
   ```
