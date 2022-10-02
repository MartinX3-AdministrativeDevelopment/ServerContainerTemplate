# Description

Using IPMI to remotely install a server OS.

## Table of contents

1. [Usage](#usage)
2. [FAQ](#faq)
    1. [Reset IPMI](#reset-IPMI)

### Usage

Because of the trouble the average user has using IPMI on servers we use a container.

https://github.com/solarkennedy/ipmi-kvm-docker

Please use its README.

### FAQ

#### Reset IPMI

1. Please reboot on rescue mode (as example Ubuntu 18)
2. Execute `sudo ipmitool mc reset cold`
3. Wait 5 min
4. Reboot the server on normal mode
5. Create a new IPMI session