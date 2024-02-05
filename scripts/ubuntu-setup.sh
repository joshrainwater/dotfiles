#!/bin/sh

# Upgrade and add the Repos we need
apt upgrade && apt update && apt install ca-certificates apt-transport-https software-properties-common lsb-release -y

# Github API
type -p curl >/dev/null || (sudo apt update && sudo apt install curl -y)
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \

# For PHP
add-apt-repository ppa:ondrej/php -y
# For Neovim
add-apt-repository ppa:neovim-ppa/unstable

#---
apt update && apt upgrade

# Basic Software
apt-get install openssl git fzf gcc curl gnupg gh neovim -y

# Aws CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install

# Run the other scripts.
./install-lazygit.sh
./install-php-environment.sh
./install-js-environment.sh

# Later: Install Go, Install Python
