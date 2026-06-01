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

# Because this doesn't exist by default
mkdir -p ~/.local/bin
