#!/usr/bin/env bash

WWW="/var/www"
cd $WWW

cp -a /temp/html/. ./html/

OPENCART="${WWW}/opencart"
sudo rm -rf $OPENCART
git clone https://github.com/opencart/opencart.git
cd $OPENCART
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59

mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php
mv ./upload/.htaccess.txt ./upload/.htaccess

sudo rm -rf ./upload/system/storage/vendor
composer install

cd $WWW
mv ./opencart/upload/ ./opencart-temp/
rm -rf ./opencart/
mv ./opencart-temp/ ./opencart/

APACHE_SITES_ENABLED="/etc/apache2/sites-enabled"
APACHE_SITES_AVAILABLE="/etc/apache2/sites-available"
DEFAULT_ENABLED_CONF="${APACHE_SITES_ENABLED}/000-default.conf"
DEFAULT_AVAILABLE_CONF="${APACHE_SITES_AVAILABLE}/000-default.conf"
sudo chmod 777 $DEFAULT_ENABLED_CONF
sudo chmod 777 $DEFAULT_AVAILABLE_CONF
sudo rm $DEFAULT_ENABLED_CONF
sudo rm $DEFAULT_AVAILABLE_CONF

cp /temp/configs/*.conf $APACHE_SITES_AVAILABLE
ln -s "${APACHE_SITES_AVAILABLE}/opencart.conf" "${APACHE_SITES_ENABLED}/opencart.conf"
ln -s "${APACHE_SITES_AVAILABLE}/html.conf" "${APACHE_SITES_ENABLED}/html.conf"
