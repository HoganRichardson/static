#!/bin/bash
curl -Lo /tmp/sift https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux

curl -Lo /tmp/ https://github.com/sans-dfir/sift-cli/releases/download/v1.7.1/sift-cli-linux.sha256.asc

gpg --keyserver hkp://pool.sks-keyservers.net:80 --recv-keys 22598A94
gpg --verify /tmp/sift-cli-linux.sha256.asc
shasum -a 256 -c /tmp/sift-cli-linux.sha256.asc || exit 1

sudo mv /tmp/sift /usr/local/bin/sift
chmod 755 /usr/local/bin/sift
