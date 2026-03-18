#!/bin/sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
. "$SCRIPT_DIR/../.env.local"

if [ -z "$DISTRO" ]; then
    DISTRO=ubuntu
fi

if [ "$APPS_OBSIDIAN" = true ]; then
  echo "Installing Obsidian..."
  if [ "$DISTRO" = "arch" ]; then
    sudo pacman -S --noconfirm obsidian
  else
    sudo snap install obsidian --classic
  fi
fi

if [ "$APPS_ANTIGRAVITY" = true ]; then
  echo "Installing Antigravity..."
  if [ "$DISTRO" = "arch" ]; then
    paru -S --noconfirm antigravity-bin
  else
    wget -qO- https://packages.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/google-antigravity.gpg
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-antigravity.gpg] https://packages.google.com/apt/antigravity stable main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
    sudo apt update -y
    sudo apt install antigravity -y
  fi
fi

if [ "$APPS_GHOSTTY" = true ]; then
  echo "Installing Ghostty..."
  if [ "$DISTRO" = "arch" ]; then
    sudo pacman -S --noconfirm ghostty
  else
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
  fi
fi

if [ "$APPS_OPENCODE" = true ]; then
  echo "Installing OpenCode..."
  if [ "$DISTRO" = "arch" ]; then
    sudo pacman -S --noconfirm opencode
  else
    curl -fsSL https://opencode.ai/install | bash
  fi
fi

if [ "$APPS_OLLAMA" = true ]; then
  echo "Installing Ollama..."
  if [ "$DISTRO" = "arch" ]; then
    sudo pacman -S --noconfirm ollama
  else
    curl -fsSL https://ollama.com/install.sh | sh
  fi
fi
