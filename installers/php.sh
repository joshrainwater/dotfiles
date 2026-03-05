#!/bin/sh
sudo apt-get install php8.3 php8.3-cli php8.3-curl php8.3-opcache php8.3-xml php8.3-common php8.3-gd php8.3-readline php8.3-zip php8.3-fpm php8.3-mbstring php8.3-sqlite3 -y

# Install Box to build Phars
curl -LSs https://box-project.github.io/box2/installer.php | php
mv box.phar ~/.local/bin/box

# Composer
EXPECTED_CHECKSUM="$(php -r 'copy("https://composer.github.io/installer.sig", "php://stdout");')"
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
ACTUAL_CHECKSUM="$(php -r "echo hash_file('sha384', 'composer-setup.php');")"

if [ "$EXPECTED_CHECKSUM" != "$ACTUAL_CHECKSUM" ]
then
    >&2 echo 'ERROR: Invalid installer checksum'
    rm composer-setup.php
else
    php composer-setup.php --install-dir="$HOME/.local/bin" --filename="composer" --quiet
    rm composer-setup.php
fi

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
