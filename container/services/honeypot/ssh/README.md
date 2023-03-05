# Description

SSH HoneyPot

Endlessh is an SSH tarpit that very slowly sends an endless, random SSH banner.
It keeps SSH clients locked up for hours or even days at a time.
The purpose is to put your real SSH server on another port and then let the script kiddies get stuck in this tarpit instead of bothering a real server.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [Server](../../../../base/operating-system)

### Installation instructions

1. Follow the docs of
    - [endlessh](https://github.com/skeeto/endlessh)
    - [docker-endlessh](https://github.com/linuxserver/docker-endlessh)
2. Start the pod
   ```bash
   cp honeypot-ssh-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start honeypot-ssh-pod.service
   ```
3. Open the firewall
   ```bash
   firewall-cmd --zone=public --add-service=ssh --permanent
   firewall-cmd --reload
   ```
