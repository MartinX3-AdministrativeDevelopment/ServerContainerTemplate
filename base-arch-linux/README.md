# Description
Creating an arch linux server for Docker Compose

## Table of contents
1. [Installation instructions](#installation-instructions)
    1. [Arch Linux Server](#arch-linux-server)
    1. [SSH](#ssh)
    1. [DynDNS](#dyndns)
    1. [Docker Compose](#docker-compose)
1. [Maintenance Tips](#maintenance-tips)
1. [Security Tips](#security-tips)

### Installation instructions
#### Arch Linux Server
1. [Installation](https://wiki.archlinux.org/index.php/Installation_guide)
    1. Partitionlayout -> [GPT](https://wiki.archlinux.org/index.php/Partitioning#UEFI/GPT_layout_example)  
    1. Kernel -> `linux-lts`
    1. If UEFI is used, please use:  
       Bootloader -> [systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot)
1. Install & configure software:
    1. [Network name resolution](https://wiki.archlinux.org/index.php/Systemd-resolved)
    1. [Sync packet mirrors](https://wiki.archlinux.org/index.php/Reflector)
    1. [sudo](https://wiki.archlinux.org/index.php/sudo)
1. [Create your own user](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)
#### SSH
1. Installation of [Secure_Shell](https://wiki.archlinux.org/index.php/Secure_Shell) or [OpenSSH](https://wiki.archlinux.org/index.php/OpenSSH)
#### DynDNS
1. [Free DynDNS service](https://freedns.afraid.org/)
1. [Updater for the dyndns service](https://wiki.archlinux.org/index.php/Systemd/Timers)
    1. Example systemD [dyndns.timer](examples/dyndns/dyndns.timer) & [dyndns.service](examples/dyndns/dyndns.service) file.
    1. Push them to `/etc/dyndns/system/`
    1. Enable the timer with `systemctl enable dyndns.timer && systemctl start dyndns.timer`
#### Docker Compose
1. [Installation](https://docs.docker.com/compose/)
    1. `pacman -S docker-compose`
    1. [Arch wiki](https://wiki.archlinux.org/index.php/Docker)
#### Maintenance Tips
1. [Bash autocompletion](https://wiki.archlinux.org/index.php/Bash#Tab_completion)
1. [Arch Wiki](https://wiki.archlinux.org/index.php/System_maintenance)
1. Displaying informations & updateable packages on (ssh) login
    1. `pacman -S lm_sensors`
    1. [Example systemD motd generation files.](examples/motd/)
    1. Push them to `/etc/systemd/system/`
    1. Enable the timer with `systemctl enable motd.timer && systemctl start motd.timer`
1. [Displaying open updates on a dashboard for your servers](https://github.com/furlongm/patchman)
1. [Monitoring server health](https://wiki.archlinux.org/index.php/Monitorix)
#### Security Tips
1. [Generate SSL config](https://ssl-config.mozilla.org/)
1. [Test Website security](https://www.ssllabs.com/ssltest/)
