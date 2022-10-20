# Description

Creating an arch linux server

## Table of contents

1. [Installation instructions](#installation-instructions)
2. [Links](#links)

### Installation instructions

1. [Installation](https://wiki.archlinux.org/index.php/Installation_guide)
   1. Partition-layout -> [GPT](https://wiki.archlinux.org/index.php/Partitioning#UEFI/GPT_layout_example)
   2. Kernel -> `linux-lts`
   3. If UEFI is used, please use:  
      Bootloader -> [systemd-boot](https://wiki.archlinux.org/index.php/Systemd-boot)
2. Install & configure software:
   1. [Network name resolution](https://wiki.archlinux.org/index.php/Systemd-resolved)
   2. [Sync packet mirrors](https://wiki.archlinux.org/index.php/Reflector)
   3. [sudo](https://wiki.archlinux.org/index.php/sudo)
3. [Create your own user](https://wiki.archlinux.org/index.php/Users_and_groups#User_management)

### Links

1. [Arch wiki](https://wiki.archlinux.org/)
2. [Arch Wiki - General_recommendations](https://wiki.archlinux.org/title/General_recommendations)
3. [Encryption & remote unlocking - Step-by-Step Guide](https://github.com/random-archer/mkinitcpio-systemd-tool/wiki/Case%3A-Complete-BTRFS-Setup-%28step-by-step%29)
