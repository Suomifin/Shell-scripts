echo "Server basics installitation."

echo "Updates and upgrades"
sudo apt update
sudo apt upgrade -y

echo "Installing nginx"
sudo apt install nginx -y

echo "Installing php 8.0"
sudo curl https://packages.sury.org/php/apt.gpg -o /etc/apt/trusted.gpg.d/php.gpg
sudo echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list
sudo apt update
sudo apt install -y php8.0 php8.0-{cli,common,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

sudo systemctl enable php8.0-fpm
sudo systemctl start php8.0-fpm

echo "Script by: Suomifin"
echo "Last update: 3.6.2022"
