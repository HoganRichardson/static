#!/bin/bash

if [[ -z $1 ]]
then
	echo "[!] Usage: ./makevagrant.sh hostname [IP] [DIR]"
	exit 1
fi

# Get hostname
hostname=$1

if [[ ! -z $2 ]] 
then
	IP=$2
else
	IP="10.10.10.255" # Use as default if IP not specified
	echo "[i]  No IP Specified, using $IP as default"
fi

# Create directory in $VM directory
echo "Creating Directories..."
if [[ ! -z $3 ]] 
then
	VM="$3"
else
	VM="$HOME/Documents/vms"
	echo "[i]  No DIR Specified, Using default directory: $VM"
fi

mkdir $VM/$hostname || exit 1
sharedir=$VM/$hostname/share
mkdir $sharedir

# Initialise Vagrantfile
echo "Initialising Vagrantfile"
cp Vagrantfile.template $VM/$hostname/Vagrantfile.template || exit 1
sed -e "s/\${IP}/$IP/" -e "s|\${sharedir}|$sharedir|" -e "s/\${hostname}/$hostname/" $VM/$hostname/Vagrantfile.template > $VM/$hostname/Vagrantfile
rm $VM/$hostname/Vagrantfile.template #cleanup

# Launching VM
echo "Attempting to launch VM..."
cd $VM/$hostname
echo "Stopped"
#vagrant up
