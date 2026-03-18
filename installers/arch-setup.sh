#!/bin/sh

# Update system
sudo pacman -Syu --noconfirm

# Base packages
sudo pacman -S --noconfirm \
    git \
    gcc \
    g++ \
    curl \
    gnupg \
    zip \
    unzip \
    sqlite \
    openssl \
    base-devel \
    fzf \
    zoxide \
    neofetch \
    ripgrep \
    fd \
    eza \
    bat \
    btop \
    git-delta \
    github-cli \
    neovim

# Install paru (AUR helper) if not present
if ! command -v paru >/dev/null 2>&1; then
    TMPDIR=$(mktemp -d)
    git clone https://github.com/Morganamilo/paru.git "$TMPDIR"
    cd "$TMPDIR"
    makepkg -si --noconfirm
    cd -
    rm -rf "$TMPDIR"
fi

# AWS CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip -o awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Because this doesn't exist by default
mkdir -p ~/.local/bin
