WORKSPACE="/workspaces/opencart-plugins"

# Clean /var/www
WWW="/var/www"
cd $WWW
rm -rf ./html

# Clone opencart and checkout to 3.0.3.8
OPENCART="${WWW}/opencart"
rm -rf $OPENCART
git clone https://github.com/opencart/opencart.git
chmod -R 755 $OPENCART
cd $OPENCART
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59

# Prepare config files
mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php

# Rebuild composer dependencies
rm -rf ./upload/system/storage/vendor
composer install

# Clean useless site
rm /etc/apache2/sites-enabled/000-default.conf

# Expand opencart apache config
cp "${WORKSPACE}/.devcontainer/opencart.conf" /etc/apache2/sites-available
ln -s /etc/apache2/sites-available/opencart.conf /etc/apache2/sites-enabled/opencart.conf

# Run apache
service apache2 start
