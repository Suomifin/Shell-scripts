echo 'Server basics installitation.'

echo 'Updates and upgrades'
apt update
apt upgrade -y

echo 'Installing nginx'
apt install nginx -y

echo 'Installing php 8.0'
curl https://packages.sury.org/php/apt.gpg -o /etc/apt/trusted.gpg.d/php.gpg
echo "deb https://packages.sury.org/php/ buster main" | tee /etc/apt/sources.list.d/php.list
apt update
apt install -y php8.0 php8.0-{cli,common,gd,mysql,mbstring,bcmath,xml,fpm,curl,zip}

systemctl enable php8.0-fpm
systemctl start php8.0-fpm
