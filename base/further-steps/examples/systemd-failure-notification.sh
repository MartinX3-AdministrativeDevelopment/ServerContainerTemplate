#!/bin/sh
# /usr/local/bin/systemd-failure-notification.sh

echo "Subject: Systemd service failed: $1" | msmtp -a default report@exploding-hamster.duckdns.org
