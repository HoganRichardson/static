#!/bin/bash

echo "Installing pwntools..."
sudo apt-get update && \
sudo DEBIAN_FRONTEND=noninteractive apt-get install -y python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential && \
sudo pip install --upgrade pip && \
sudo pip install --upgrade pwntools

echo "Installing pwndbg..."
cd && \
git clone https://github.com/pwndbg/pwndbg && \
cd pwndbg && \
./setup.sh 

