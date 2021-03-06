#!/bin/bash

#  ** USAGE: **
##   > Call from Vagrant provisioning
##   > argv[1] = hostname

# Set Hostname
echo "[i:DEFAULT] Setting hostname..."
echo "$1" > /etc/hostname || exit 1

# Run provisioning script
SCRIPT="ubuntu.sh"
wget https://raw.githubusercontent.com/HoganRichardson/static/master/scripts/provisioning/$SCRIPT && \
	chmod +x $SCRIPT && \
	./$SCRIPT && \
	rm $SCRIPT
