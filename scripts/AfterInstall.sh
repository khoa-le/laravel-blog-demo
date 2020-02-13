#!/bin/bash
# Set permissions to storage and bootstrap cache
sudo chmod -R 0777 /var/www/html/storage
sudo chmod -R 0777 /var/www/html/bootstrap/cache
#
cd /var/www/html
#
# Run composer
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
sudo php composer-setup.php -- --install-dir=/home/ec2-user --filename=composer
sudo rm composer-setup.php

sudo /usr/bin/composer.phar install --no-ansi --no-dev --no-suggest --no-interaction --no-progress --prefer-dist --no-scripts -d /var/www/html
#
# Run artisan commands
php /var/www/html/artisan migrate
