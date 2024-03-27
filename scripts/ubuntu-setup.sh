#!/bin/sh

# Upgrade and add the Repos we need
sudo apt upgrade -y && sudo apt update -y && sudo apt install ca-certificates apt-transport-https software-properties-common lsb-release -y

# Github API
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg \
&& sudo chmod go+r /usr/share/keyrings/githubcli-archive-keyring.gpg \
&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \

# Add extra repositories
sudo add-apt-repository ppa:ondrej/php -y
sudo add-apt-repository ppa:neovim-ppa/unstable -y

#---
sudo apt update -y && sudo apt upgrade -y

# The basics
sudo apt-get install openssl git fzf gcc g++ curl gnupg gh neovim zip unzip sqlite3 zoxide neofetch powerline ripgrep fd-find -y

# Aws CLI
curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip"
unzip awscliv2.zip
sudo ./aws/install
rm -rf aws awscliv2.zip

# Because this doesn't exist by default
mkdir ~/.local/bin

# Run the other scripts.
./install-lazygit.sh
./install-php-environment.sh
./install-js-environment.sh

# Later: Install Go, Install Python

exec bash -l
