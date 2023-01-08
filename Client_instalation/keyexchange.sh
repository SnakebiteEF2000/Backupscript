#!/bin/bash

# Check if script is being run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# Prompt user for remote host
read -p "Enter remote host (e.g. user@example.com): " REMOTE_HOST

# Generate SSH key
echo "Generating SSH key..."
ssh-keygen -t rsa -b 4096

# Copy SSH key to remote host
echo "Copying SSH key to remote host..."
ssh-copy-id $REMOTE_HOST

echo "SSH key copied to remote host. You can now use passwordless SSH connections to the remote host."
