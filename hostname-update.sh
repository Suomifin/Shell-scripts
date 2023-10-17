#!/bin/bash
echo "Script made by suomifin || suomifin.eu"

read -p "Enter the new hostname (e.g. debian-vm101): " new_hostname

sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname/g" /etc/hosts

echo "$new_hostname" | sudo tee /etc/hostname

echo "Hostname has been updated to $new_hostname"

read -p "Do you want to reboot now? (y/n): " reboot_choice

if [ "$reboot_choice" == "y" ]; then
    sudo reboot
else
    echo "Please remember to reboot your system to apply the changes."
fi

