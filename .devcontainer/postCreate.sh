WORKSPACE="/workspaces/opencart-plugins/"
cd $WORKSPACE

# Clone opencart and checkout to 3.0.3.8
OPENCART="${WORKSPACE}opencart"
rm -rf $OPENCART
git clone https://github.com/opencart/opencart.git
cd $OPENCART
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59

# Prepare config files
mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php

# Rebuild composer dependencies
rm -rf ./upload/system/storage/vendor
composer install
