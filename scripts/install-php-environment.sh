#!/bin/sh
sudo apt-get install php8.3-cli php8.3-curl php8.3-opcache php8.3-xml php8.3-xml php8.3-common php8.3-gd php8.3-readline php8.3-zip

./install-composer.sh

# PHPActor install
# php-cs-fixer install

# Laravel Installer
composer global require laravel/installer:^5.5
