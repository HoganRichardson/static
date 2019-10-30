#!/bin/bash

#  ** USAGE: **
##   > Call from Vagrant provisioning
##   > argv[1] = hostname

# Set Hostname
echo "[i:DEFAULT] Setting hostname..."
echo "$1" > /etc/hostname || exit 1

# Install useful defaults
apt install -y build-essential
