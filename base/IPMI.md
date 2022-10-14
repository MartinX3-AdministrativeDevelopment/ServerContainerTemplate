# Description

Using IPMI to remotely install a server OS.

## Table of contents

1. [FAQ](#faq)
   1. [IPMI needs TLS 1.1 and Java 6](#IPMI-needs-TLS-1.1-and-Java-6)
   2. [Reset IPMI](#reset-IPMI)

### FAQ

#### IPMI needs TLS 1.1 and Java 6

The most up-to-date repo
https://github.com/DomiStyle/docker-idrac6

Contains chrome-browser without java plugin
https://github.com/solarkennedy/ipmi-kvm-docker

Contains firefox with java plugin
https://github.com/lmacka/ipmi-kvm-docker

#### Reset IPMI

1. Please reboot on rescue mode (as example Ubuntu 18)
2. Execute `sudo ipmitool mc reset cold`
3. Wait 5 min
4. Reboot the server on normal mode
5. Create a new IPMI session
