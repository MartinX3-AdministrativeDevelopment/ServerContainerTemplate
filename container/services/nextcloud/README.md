# Description

Nextcloud

Nextcloud server, a safe home for all your data.

## Table of contents

1. [Service requirements](#service-requirements)
2. [Installation instructions](#installation-instructions)

### Service requirements

- [SMTP gateway](../notification/README.md)
- [Database](../postgresql/README.md)

### Installation instructions

1. Follow the docs of
    - [Nextcloud](https://nextcloud.com/support/)
    - https://docs.linuxserver.io/general/swag#nextcloud-subdomain-reverse-proxy-example
    - https://github.com/linuxserver/docker-nextcloud
2. Configuration inside ldap pod
   ```bash
   dsidm -b dc=exploding-hamster,dc=duckdns.org localhost user create --uid nextcloud_db --cn databases --displayName "Nextcloud Database" --uidNumber 1001 --gidNumber 1001 --homeDirectory /home/nextcloud_db
   dsidm -b dc=exploding-hamster,dc=duckdns.org localhost account reset_password uid=nextcloud_db,ou=people,dc=exploding-hamster,dc=duckdns.org
   
   # Add nextcloud accounts as needed
   dsidm -b dc=exploding-hamster,dc=duckdns.org localhost user create --uid username --cn users --displayName "Max Mustermann" --uidNumber 1002 --gidNumber 1002 --homeDirectory /home/username
   dsidm -b dc=exploding-hamster,dc=duckdns.org localhost account reset_password uid=username,ou=people,dc=exploding-hamster,dc=duckdns.org
   ```
3. Configuration inside database pod
   ```bash
   psql -U postgres -h localhost -c "CREATE ROLE nextcloud_db WITH CREATEDB LOGIN;"
   ```
4. Start the pod
   ```bash
   podman kube play nextcloud-pvc.yaml
   # podman kube play nextcloud-secret.yaml # TODO WORKAROUND FOR https://github.com/containers/podman/issues/16269
   podman secret create nextcloud-secret nextcloud-secret.json
   systemctl --user enable --now podman-kube@$(systemd-escape $(pwd)/nextcloud-pod.yaml).service
   ```
5. Setup https container
    1. [nextcloud.subdomain.conf](nextcloud.subdomain.conf)
    2. Restart it
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
