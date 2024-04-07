# Description

Nextcloud

Nextcloud server, a safe home for all your data.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [Database](../database/README.md)
- [SMTP gateway](../notification/README.md)

### Installation instructions

1. Follow the docs of
    - [Nextcloud](https://nextcloud.com/support/)
    - https://docs.linuxserver.io/general/swag#nextcloud-subdomain-reverse-proxy-example
    - https://github.com/linuxserver/docker-nextcloud
2. Configuration inside ldap pod
   ```bash
   dsidm --basedn ${DS_SUFFIX_NAME} --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost user create --uid nextcloud_db --cn databases --displayName "Nextcloud Database" --uidNumber 1001 --gidNumber 1001 --homeDirectory /home/nextcloud_db
   dsidm --basedn ${DS_SUFFIX_NAME} --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost account reset_password uid=nextcloud_db,ou=people,${DS_SUFFIX_NAME}
   
   # Add nextcloud accounts as needed
   dsidm --basedn ${DS_SUFFIX_NAME} --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost user create --uid username --cn users --displayName "Max Mustermann" --uidNumber 1002 --gidNumber 1002 --homeDirectory /home/username
   dsidm --basedn ${DS_SUFFIX_NAME} --binddn "cn=Directory Manager" --bindpw ${DS_DM_PASSWORD} localhost account reset_password uid=username,ou=people,${DS_SUFFIX_NAME}
   ```
3. Configuration inside database pod
   ```bash
   psql -U postgres -h localhost -c "CREATE ROLE nextcloud_db WITH CREATEDB LOGIN;"
   ```
4. Start the pod
   ```bash
   podman kube play nextcloud-pvc.yaml
   podman kube play nextcloud-secret.yaml
   cp nextcloud-pod.kube ~/.config/containers/systemd/
   systemctl --user daemon-reload
   systemctl --user start nextcloud-pod.service
   ```
5. [Setup https container](../dynds-https-ip/README.md)
6. Setup [LDAP](https://docs.nextcloud.com/server/latest/admin_manual/configuration_user/user_auth_ldap.html)
    - Host: ldap
    - Port: 3389
    - Basis-DN: dc=exploding-hamster,dc=duckdns.org
    - Anmeldeattribute
        - ↓ LDAP-Abfrage bearbeiten
            - Hinzufügen von `(cn=users)
                - Beispiel:
                  `(&(|(objectclass=posixAccount))(uid=%uid))`
                  zu
                  `(&(|(objectclass=posixAccount))(uid=%uid)(cn=users))`
7. [Add the persistent volumes to the borg backup client](../../../container/services/borg-backup/client/README.md)
