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
sudo mv /home/ec2-user/composer /usr/bin/composer

sudo /usr/bin/composer install --no-ansi --no-dev --no-suggest --no-interaction --no-progress --prefer-dist --no-scripts -d /var/www/html
#
# Run artisan commands
