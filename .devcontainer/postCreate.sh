cd /workspaces/opencart-plugins/
git clone https://github.com/opencart/opencart.git
cd ./opencart/
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59
mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php
rm -rf ./upload/system/storage/vendor/
mkdir /workspaces/opencart-plugins/composer-temp/
cd /workspaces/opencart-plugins/composer-temp/
cp ../opencart/composer.json ./composer.json
cp ../opencart/composer.lock ./composer.lock
composer install
cd /workspaces/opencart-plugins/
mv ./composer-temp/system/storage/vendor/ ./opencart/upload/system/storage/vendor/
rm -rf /workspaces/opencart-plugins/composer-temp/
