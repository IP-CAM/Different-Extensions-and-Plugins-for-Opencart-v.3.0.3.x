cd /workspaces/opencart-plugins/
git clone https://github.com/opencart/opencart.git
cd ./opencart/
git checkout 8b4144edc3d54bfabea1295f936f7962e3a81d59
mv ./upload/config-dist.php ./upload/config.php
mv ./upload/admin/config-dist.php ./upload/admin/config.php
