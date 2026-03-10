#!/bin/sh

SCRIPT_DIR="$(dirname "$(readlink -f "$0")")"
. "$SCRIPT_DIR/../.env.local"

if [ "$APPS_OBSIDIAN" = true ]; then
  echo "Installing Obsidian..."
  sudo snap install obsidian --classic
fi

if [ "$APPS_ANTIGRAVITY" = true ]; then
  echo "Installing Antigravity..."
  wget -qO- https://packages.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/google-antigravity.gpg
  echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-antigravity.gpg] https://packages.google.com/apt/antigravity stable main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
  sudo apt update -y
  sudo apt install antigravity -y
fi

if [ "$APPS_GHOSTTY" = true ]; then
  echo "Installing Ghostty..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/mkasberg/ghostty-ubuntu/HEAD/install.sh)"
fi

if [ "$APPS_OPENCODE" = true ]; then
  echo "Installing OpenCode..."
  curl -fsSL https://opencode.ai/install | bash
fi

if [ "$APPS_OLLAMA" = true ]; then
  echo "Installing Ollama..."
  curl -fsSL https://ollama.com/install.sh | sh
fi
