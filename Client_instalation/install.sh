#!/bin/bash

# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Create user
useradd -m -d /home/resync-backup resync-backup

# Prompt user to enter password for the user
read -s -p "Enter password for resync-backup user: " password
echo

# Set password for user
echo "resync-backup:$password" | chpasswd

# Create backups folder
mkdir /home/resync-backup/backups

# Set permissions for backups folder
chown resync-backup:resync-backup /home/resync-backup/backups
chmod 700 /home/resync-backup/backups

# Store path to directory of current script
SCRIPT_PATH=$(dirname "$(readlink -f "$0")")

# Create path to shh keygen script
SSH_SCRIPT_PATH="$SCRIPT_PATH/keyexchange.sh"

source "$SSH_SCRIPT_PATH"