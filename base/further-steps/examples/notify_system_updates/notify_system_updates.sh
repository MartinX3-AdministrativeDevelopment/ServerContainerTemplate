#!/bin/bash
# /usr/local/bin/notify_system_updates.sh

pacman -Sy

AVAILABLE_UPDATES=$(pacman -Qu)

if [ -n "$AVAILABLE_UPDATES" ]; then
  printf "Subject: Available system updates!\n\n%s" "$AVAILABLE_UPDATES" | msmtp -a default report@exploding-hamster.duckdns.org
fi
