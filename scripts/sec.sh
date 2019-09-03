#!/bin/bash

echo "Installing pwntools..."
sudo apt-get update && \
sudo apt-get install -y python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential && \
sudo pip install --upgrade pip && \
sudo pip install --upgrade pwntools

echo "Installing pwndbg..."
git clone https://github.com/pwndbg/pwndbg && \
cd pwndbg && \
./setup.sh 

cd .. && \ 
rm -r pwndbg
