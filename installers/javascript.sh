#!/bin/sh

if command -v pacman &>/dev/null; then
  sudo pacman -S --noconfirm nvm
  [ -s /usr/share/nvm/init-nvm.sh ] && . /usr/share/nvm/init-nvm.sh
else
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.4/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
  [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"
fi

nvm install node
npm install -g typescript typescript-language-server tsx expo
