#!/bin/sh
curl -Lo go.tar.gz https://go.dev/dl/go1.22.1.linux-amd64.tar.gz

rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz
