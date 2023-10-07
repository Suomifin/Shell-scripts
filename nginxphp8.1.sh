echo "Welcome to Suomifin Nginx and PhP 8.1 installation script!"
echo ""
echo ""

clear
echo "Update and upgrade packages!"
apt update
apt upgrade -y

clear
echo "Installing php repositories and php 8.1!"

echo "deb https://packages.sury.org/php/ $(lsb_release -sc) main" | sudo tee /etc/apt/sources.list.d/sury-php.list
curl -fsSL  https://packages.sury.org/php/apt.gpg | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/sury-keyring.gpg
apt install -y php8.1 php8.1-{common,cli,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

clear
echo "Installing nginx!"
apt install nginx -y

echo "Script by: Suomifin"
echo "Last update: 7.10.2023"