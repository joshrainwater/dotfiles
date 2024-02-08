#!/bin/sh
sudo apt-get install php8.2 php8.2-cli php8.2-curl php8.2-opcache php8.2-xml php8.2-common php8.2-gd php8.2-readline php8.2-zip php8.2-fpm php8.2-mbstring php8.2-sqlite3 -y

# Install Box to build Phars
curl -LSs https://box-project.github.io/box2/installer.php | php
mv box.phar ~/.local/bin/box

# Composer
./install-composer.sh

# PHPActor install
curl -Lo phpactor.phar https://github.com/phpactor/phpactor/releases/latest/download/phpactor.phar
sudo chmod +x phpactor.phar
mv phpactor.phar ~/.local/bin/phpactor

# php-cs-fixer install
curl -Lo php-cs-fixer.phar https://cs.symfony.com/download/php-cs-fixer-v3.phar
sudo chmod a+x php-cs-fixer.phar
mv php-cs-fixer.phar ~/.local/bin/php-cs-fixer

# Laravel Installer
composer global require laravel/installer:^5.5
