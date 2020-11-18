# Description
A gitlab server

### Table of contents
1. [Project requirements](#project-requirements)
1. [Installation instructions](#installation-instructions)
1. [Usage](#usage)
1. [Links](#links)

#### Project requirements
- [Arch Linux Server](../https/README.md)

#### Installation instructions
1. `docker-compose up -d`

#### Usage
1. Service exist at the address `localhost/gitlab` (You can replace `localhost` by the IP of the host machine).
1. On the first access you need to set a password for the standard administrator user `root`, as example `password`.
1. Now you can login as root or another account or with LDAP or you can create a new account.
1. GitLab works. For further usage, please read the [documentation](https://docs.gitlab.com/).

#### Links
1. [Usage of the LDAP userdatabase](https://ux-2s18.inf.h-brs.de/faq/informationen-fuer-labore/nutzen-der-ldap-benutzerdatenbank)
