# Description

HTTPS & DynDNS support

SWAG - Secure Web Application Gateway sets up a Nginx webserver and reverse proxy with php support, a DynDNS IP refresher and certbot client that automates free SSL server
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
2. Install files
   1. Container -> [www.conf](www.conf)
3. Start the pod
   ```bash
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/dyndns-https-ip-pod.yaml).service
   ```
4. Open the firewall
   ```bash
   firewall-cmd --add-service=http --permanent
   firewall-cmd --add-service=https --permanent
   firewall-cmd --reload
   ```

### Notes

- ZeroSSL offers max. 3 SSL certificates at a time -> https://zerossl.com/pricing/