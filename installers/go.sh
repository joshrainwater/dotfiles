#!/bin/sh
curl -Lo go.tar.gz https://go.dev/dl/go1.26.0.linux-amd64.tar.gz

sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
rm go.tar.gz

# Install Air
/usr/local/go/bin/go install github.com/air-verse/air@latest

# Install Wails
/usr/local/go/bin/go install github.com/wailsapp/wails/v2/cmd/wails@latest
