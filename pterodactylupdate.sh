echo "Pterodactyl update script!"
echo "Upgrading panel!"
echo ""
echo ""

echo ""
echo "Enter Maintenance Mode!"
cd /var/www/pterodactyl
php artisan down

echo ""
echo "Download the Update!"
curl -L https://github.com/pterodactyl/panel/releases/latest/download/panel.tar.gz | tar -xzv

echo ""
chmod -R 755 storage/* bootstrap/cache

echo ""
echo "Update Dependencies!"
composer install --no-dev --optimize-autoloader

echo ""
echo "Clear Compiled Template Cache!"
php artisan view:clear
php artisan config:clear

echo ""
echo "Database Updates!"
php artisan migrate --seed --force

echo ""
echo "Set Permissions!"
chown -R www-data:www-data /var/www/pterodactyl/*

echo ""
echo "Restarting Queue Workers"
php artisan queue:restart

echo ""
echo "Exit Maintenance Mode"
php artisan up

echo "-----------------------"

echo "Upgrading wings!"

echo ""
echo "Downloading files!"
curl -L -o /usr/local/bin/wings https://github.com/pterodactyl/wings/releases/latest/download/wings_linux_amd64
chmod u+x /usr/local/bin/wings

echo ""
echo "Restarting wings!"
systemctl restart wings
