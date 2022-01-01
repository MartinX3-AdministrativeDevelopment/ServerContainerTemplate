# Description

HTTPS support

SWAG - Secure Web Application Gateway sets up an Nginx webserver and reverse proxy with php support and a built-in
certbot client that automates free SSL server certificate generation and renewal processes (Let's Encrypt and ZeroSSL).\
It also contains fail2ban for intrusion prevention.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)
3. [Notes](#notes)

### Service requirements

- [Server](../../../base/operating-system)

### Installation instructions

1. Create the volume if it does not exist.
    1. `podman play kube ./https-pod-pvc.yaml`
2. Configure the env variables in [https-pod.yaml](https-pod.yaml)
3. `podman play kube ./https-pod.yaml`
4. Follow the [docs](https://docs.linuxserver.io/general/swag)
5. Let the pod autostart with the system
    1. `cd ~/.config/systemd/user/`
    2. `podman generate systemd --files --name https-nginx`
    3. `systemctl --user --now enable pod-https-nginx.service`
    4. `systemctl --user --now enable container-https-nginx-swag.service`
6. An example config is [here](examples)

### Notes

- ZeroSSL offers max. 3 SSL certificates at a time -> https://zerossl.com/pricing/
- [podman play kube docs](https://docs.podman.io/en/latest/markdown/podman-play-kube.1.html)
- [podman generate kube docs](https://docs.podman.io/en/latest/markdown/podman-generate-kube.1.html)
- [kubernetes objects docs](https://kubernetes.io/docs/concepts/overview/working-with-objects/kubernetes-objects/)
- [kubernetes API pod reference](https://kubernetes.io/docs/reference/kubernetes-api/workload-resources/pod-v1/)
