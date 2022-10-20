# Description

Universal maintenance tips

## Table of contents

1. [Installation instructions](#installation-instructions)
    1. [Firewall](#firewall)
    2. [SSH](#ssh)
    3. [DynDNS](#dyndns)
    4. [Podman](#podman)
2. [Maintenance Tips](#maintenance-tips)
3. [Security Tips](#security-tips)

### Installation instructions

#### Firewall

- [FirewallD](https://wiki.archlinux.org/title/firewalld)
    - Easy to maintain with its config files
    - Supported by Podman since v4.0 with netavark
- [Fail2Ban](https://wiki.archlinux.org/title/Fail2ban)
    - Rate limit against attacks
    - FirewallD support

#### SSH

- [OpenSSH](https://wiki.archlinux.org/title/OpenSSH)
    - By default, firewallD has ssh on port 22 enabled. Please change the port to avoid attacks.
    - ```xml
      <!-- /etc/firewalld/services/ssh-custom.xml -->
      <?xml version="1.0" encoding="utf-8"?>
      <service>
          <short>SSH Custom</short>
          <description>Service for the custom ssh port.</description>
          <port protocol="tcp" port="9999"/>
      </service>
      ```
    - ```bash
      firewall-offline-cmd --zone=public --remove-service-from-zone ssh
      firewall-offline-cmd --zone=public --add-service ssh-custom
      systemctl start firewalld.service
      # TEST YOUR SSH ACCESS BY OPENING A NEW CONNECTION!
      systemctl enable --now firewalld.service
      ```

#### DynDNS

- Services
    - IPv6 & IPv4
        - [NSUpdate](https://www.nsupdate.info/)
        - [FreeDNS](https://freedns.afraid.org/)
        - [Dynu](https://www.dynu.com/)
    - IPv4
        - [DuckDNS](https://www.duckdns.org/)
- Updater
    - Container
        - [SWAG](https://github.com/linuxserver/docker-swag)
          - DynDNS + HTTPS Proxy
        - [DuckDNS](https://hub.docker.com/r/linuxserver/duckdns/)
    - [Native Updater](examples/dyndns)

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
3. [Health status of the storage](https://wiki.archlinux.org/title/S.M.A.R.T.)
    1. Automatic email if problems happen
4. [RAID health](https://wiki.archlinux.org/title/RAID#RAID_Maintenance)
    1. Automatic email if problems happen
    2. Prefer filesystem native RAID support like RAID 1 on BTRFS
5. Filesystem health (Example [BTRFS](https://wiki.archlinux.org/title/btrfs)
   & [btrfsmaintenance](https://aur.archlinux.org/packages/btrfsmaintenance/))
    1. Automatic email if problems happen
6. [Prune unused dockerimages/-tags to free up disk space](examples/podman/prune)
7. Displaying information & updatable packages on (ssh) login
    1. [Example motd generation files.](examples/motd)
        1. Needs package `lm_sensors`
8. Use a [Podman Cockpit UI](https://github.com/cockpit-project/cockpit-podman)
    1. Use [https-nginx](../../container/services/https/README.md) together
       with [this manual to use the nginx cert](https://github.com/cockpit-project/cockpit/wiki/Proxying-Cockpit-over-nginx)

#### Security Tips

1. [Podman.io](https://podman.io/)
2. [Podman.io - Tutorials](https://docs.podman.io/en/latest/Tutorials.html)
3. [Podman.io - Documentation](https://docs.podman.io/en/latest/)
4. [Docker Wiki](https://docs.docker.com/)
5. [Docker Security](https://docs.docker.com/engine/security/)
6. [Docker Secrets](https://docs.docker.com/engine/swarm/secrets/)
7. [Generate SSL config](https://ssl-config.mozilla.org/)
8. Test website for security
    1. [SSL Labs](https://www.ssllabs.com/ssltest/)
    2. [Geekflare](https://geekflare.com/de/ssl-test-certificate/)
