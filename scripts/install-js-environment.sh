#!/bin/sh
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

nvm install node

npm install -g typescript typescript-language-server
