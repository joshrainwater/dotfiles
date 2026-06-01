#!/bin/sh

if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm go
else
  curl -Lo go.tar.gz https://go.dev/dl/go1.26.0.linux-amd64.tar.gz
  sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf go.tar.gz
  rm go.tar.gz
fi

# Install Air
go install github.com/air-verse/air@latest

# Install Wails
go install github.com/wailsapp/wails/v2/cmd/wails@latest
