# Description

HTTPS & DynDNS support

SWAG - Secure Web Application Gateway sets up a Nginx webserver and reverse proxy with php support, a DynDNS IP
refresher and certbot client that automates free SSL server
certificate generation and renewal processes (Let's Encrypt and ZeroSSL).  
It also contains fail2ban for intrusion prevention.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)
3. [Notes](#notes)

### Service requirements

- [Server](../../../base/operating-system)

### Installation instructions

1. Follow the [docs](https://docs.linuxserver.io/general/swag)
2. Start the pod
   ```bash
   podman kube play dyndns-https-pvc.yaml dyndns-https-ip-secret.yaml
   cp dyndns-https-ip-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start dyndns-https-ip-pod.service
   ```
3. Open the firewall
   ```bash
   firewall-cmd --zone=public --add-service=http --permanent
   firewall-cmd --zone=public --add-service=https --permanent
   firewall-cmd --reload
   ```
4. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)

### Notes

- ZeroSSL offers max. 3 SSL certificates at a time -> https://zerossl.com/pricing/
