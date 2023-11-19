#!/bin/bash
# /usr/local/bin/autoupdater_ServerContainerTemplate.sh

DIRECTORY=/opt/podman/ServerContainerTemplate/
EMAIL_SUBJECT="Subject: autoupdater_ServerContainerTemplate Error!"

cd $DIRECTORY || (printf "$EMAIL_SUBJECT\n\n%s" "Path not found!" | msmtp -a default report@exploding-hamster.duckdns.org && exit)

if ! git pull --rebase; then
  printf "$EMAIL_SUBJECT\n\n%s" "Error code: $?" | msmtp -a default report@exploding-hamster.duckdns.org
fi
