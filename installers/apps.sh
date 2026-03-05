#!/bin/sh

# Obsidian
echo "Installing Obsidian..."
sudo snap install obsidian --classic

# Antigravity 
echo "Installing Antigravity..."
# Assuming apt repo or snap; if apt:
wget -qO- https://packages.google.com/apt/doc/apt-key.gpg | sudo gpg --dearmor --yes -o /usr/share/keyrings/google-antigravity.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/google-antigravity.gpg] https://packages.google.com/apt/antigravity stable main" | sudo tee /etc/apt/sources.list.d/antigravity.list > /dev/null
sudo apt update -y
sudo apt install antigravity -y
