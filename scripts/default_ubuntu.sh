#!/bin/bash

#  ** USAGE: **
##   > Call from Vagrant provisioning
##   > argv[1] = hostname

# Set Hostname
echo "[i:DEFAULT] Setting hostname..."
echo "127.0.0.1    $1" > /etc/hostname || exit 1

