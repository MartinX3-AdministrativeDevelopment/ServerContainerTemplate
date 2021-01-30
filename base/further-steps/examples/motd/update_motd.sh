#!/bin/bash
# /usr/local/bin/update_motd.sh
#Script to update MOTD_FILE with relevant information.

#Color variables
BLUE_DARK="\033[01;36m"
BLUE_LIGHT="\033[01;34m"
GREEN="\033[01;32m"
RED="\e[31m"
WHITE="\033[00;37m"
WHITE_BOLD="\033[01;37m"

#Define output file
MOTD_FILE="/etc/motd"

# Sync database before showing updates
pacman -Sy
AVAILABLE_UPDATES=$(pacman -Qu)
UPDATE_COLOR=$BLUE_LIGHT
if [ -n "$AVAILABLE_UPDATES" ]; then
  UPDATE_COLOR=$RED
fi

MOTD=$MOTD$WHITE$(uname -a)"\n"
MOTD=$MOTD$WHITE$(uptime | cut -c2-)"\n"
MOTD=$MOTD$BLUE_LIGHT"CPU\t\t$WHITE= $(grep -P 'model name\t: ' </proc/cpuinfo | uniq | cut -c14-)\n"
MOTD=$MOTD$BLUE_LIGHT"Processes\t$WHITE= You are running $(ps U "$USER" h | wc -l) of $(ps -Afl | wc -l) processes \n"
MOTD=$MOTD$BLUE_LIGHT"Temperatures\n"
MOTD=$MOTD"$WHITE$(sensors)\n\n"
MOTD=$MOTD$BLUE_LIGHT"Memory & Swap\n"
MOTD=$MOTD"$WHITE$(free -ht)\n\n"
MOTD=$MOTD$BLUE_LIGHT"Disks\n"
MOTD=$MOTD"$WHITE$(df -h)\n\n"
MOTD=$MOTD$UPDATE_COLOR"SYSTEM UPDATES\n"
MOTD=$MOTD"$WHITE$AVAILABLE_UPDATES\n"

echo -e "$MOTD" >$MOTD_FILE
