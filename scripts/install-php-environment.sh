#!/bin/sh
sudo apt-get install php8.3-cli php8.3-curl php8.3-opcache php8.3-xml php8.3-common php8.3-gd php8.3-readline php8.3-zip php8.3-fpm php8.3-mbstring

./install-composer.sh

# PHPActor install
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
chmod +x phpactor.phar
mv phpactor.phar ~/.local/bin/phpactor

# php-cs-fixer install
curl -L https://cs.symfony.com/download/php-cs-fixer-v3.phar -o php-cs-fixer
chmod a+x php-cs-fixer
mv php-cs-fixer ~/.local/bin

# Laravel Installer
composer global require laravel/installer:^5.5
