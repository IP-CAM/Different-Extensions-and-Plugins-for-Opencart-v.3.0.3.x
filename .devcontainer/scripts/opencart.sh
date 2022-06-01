#!/usr/bin/env bash

# Clean /var/www
WWW="/var/www"
cd $WWW
sudo chmod -R 775 ./html
sudo rm -rf ./html

# Prepare opencart 3.0.3.8
OPENCART="${WWW}/opencart"
sudo rm -rf $OPENCART
git clone https://github.com/opencart/opencart.git
cd $OPENCART
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59
sudo chmod -R 775 $OPENCART

# Prepare config files
mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php
mv ./upload/.htaccess.txt ./upload/.htaccess

# Rebuild composer dependencies
sudo rm -rf ./upload/system/storage/vendor
composer install

# Replace folders
cd $WWW
mv ./opencart/upload/ ./opencart-temp/
rm -rf ./opencart/
mv ./opencart-temp/ ./opencart/

# Clean useless site
sudo chmod -R 775 /etc/apache2/sites-enabled/000-default.conf
sudo rm /etc/apache2/sites-enabled/000-default.conf

# Expand opencart apache config
cp /temp/configs/opencart.conf /etc/apache2/sites-available
ln -s /etc/apache2/sites-available/opencart.conf /etc/apache2/sites-enabled/opencart.conf

# Run apache
sudo service apache2 start
