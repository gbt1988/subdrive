#!/usr/bin/env bash

set -eu

# Install Go

curl -O https://storage.googleapis.com/golang/go1.12.9.linux-amd64.tar.gz

tar -xvf go1.12.9.linux-amd64.tar.gz

chown -R root:root ./go

mv go /usr/local

# Enable go for root
PROFILE_FILE=/root/.profile
echo "export GOPATH=\$HOME/go" >> $PROFILE_FILE
echo "export PATH=\$PATH:/usr/local/go/bin:\$GOPATH/bin" >> $PROFILE_FILE
