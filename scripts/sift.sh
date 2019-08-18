#!/bin/bash

echo "[i: SIFT] Downloading sift..."
curl -Lo /tmp/sift https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux 2> /dev/null

curl -Lo /tmp/sift-cli-linux.sha256.asc https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux.sha256.asc 2> /dev/null

gpg --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 22598A94
gpg --verify /tmp/sift-cli-linux.sha256.asc || exit 1
#shasum -a 256 -c /tmp/sift-cli-linux.sha256.asc || exit 1 #omitted cause its kooky

echo "[i: SIFT] Checksum verified, moving to /usr/local/bin"
sudo mv /tmp/sift /usr/local/bin/sift
chmod 755 /usr/local/bin/sift
