# Description

Universal maintenance tips

## Table of contents

1. [Installation instructions](#installation-instructions)
    1. [SSH](#ssh)
    2. [DynDNS](#dyndns)
    3. [Podman](#podman)
2. [Maintenance Tips](#maintenance-tips)
3. [Security Tips](#security-tips)

### Installation instructions

### Firewall

- [UFW](https://wiki.archlinux.org/title/Uncomplicated_Firewall)
    - Easy to maintain with its config files
    - It has a rate limit which makes sshguard / fail2ban useless for most cases, especially since they are vulnerable
      to a spoofed source header.

#### SSH

- [OpenSSH](https://wiki.archlinux.org/title/OpenSSH)
    - ```bash
      # /etc/ufw/applications.d/OpenSSH
      [OpenSSH]
      title=OpenSSH
      description=SSH access
      ports=22/tcp|22/udp # Your custom ssh port.
      ```
    - ```bash
      # ufw allow OpenSSH && ufw limit OpenSSH
      ```

#### DynDNS

1. [Example free DynDNS service](https://freedns.afraid.org/)
1. [Updater for the dyndns service](examples/dyndns)

#### Podman

Successor of docker. Compatible to docker. Better security. Designed to run rootless. Has a docker API layer with the
podman-docker package.

- [Installation](https://podman.io/)
- [Podman Rootless](https://github.com/containers/podman/blob/main/docs/tutorials/rootless_tutorial.md)
- `reboot`
- `podman network create --subnet 2001:db8::/64 --ipv6 podman`
- `loginctl enable-linger username` to keep he services running, even after a logout.

### Maintenance Tips

1. Bash autocompletion
2. Automatically clean kernel modules
    1. `paru -Syu kernel-modules-hook`
    2. `systemctl enable --now linux-modules-cleanup.service`
4. [Health status of the storage](https://wiki.archlinux.org/title/S.M.A.R.T.)
    1. Automatic email if problems happen
5. [RAID health](https://wiki.archlinux.org/title/RAID#RAID_Maintenance)
    1. Automatic email if problems happen
    2. Prefer filesystem native RAID support like RAID 1 on BTRFS
6. Filesystem health (Example [BTRFS](https://wiki.archlinux.org/title/btrfs)
   & [btrfsmaintenance](https://aur.archlinux.org/packages/btrfsmaintenance/))
    1. Automatic email if problems happen
5. [Prune unused dockerimages/-tags to free up disk space](examples/podman/prune)
6. Displaying information & updatable packages on (ssh) login
    1. [Example motd generation files.](examples/motd)
        1. Needs package `lm_sensors`
7. Use a [Podman Cockpit UI](https://github.com/cockpit-project/cockpit-podman)
    1. Use [https-nginx](../../container/services/https/README.md) together
       with [this manual to use the nginx cert](https://github.com/cockpit-project/cockpit/wiki/Proxying-Cockpit-over-nginx)

#### Security Tips

1. [Podman.io](https://podman.io/)
1. [Podman.io - Tutorials](https://docs.podman.io/en/latest/Tutorials.html)
1. [Podman.io - Documentation](https://docs.podman.io/en/latest/)
1. [Docker Wiki](https://docs.docker.com/)
1. [Docker Security](https://docs.docker.com/engine/security/)
1. [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)
1. [Generate SSL config](https://ssl-config.mozilla.org/)
1. [Test website for security](https://www.ssllabs.com/ssltest/)
1. [Further test websites for security](https://geekflare.com/de/ssl-test-certificate/)
