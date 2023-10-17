#!/bin/bash

# Ask for the new hostname
read -p "Enter the new hostname (e.g. debian-vm101): " new_hostname

# Update /etc/hosts
sudo sed -i "s/127.0.1.1.*/127.0.1.1\t$new_hostname/g" /etc/hosts

# Update /etc/hostname
echo "$new_hostname" | sudo tee /etc/hostname

# Notify the user
echo "Hostname has been updated to $new_hostname"

# Request a reboot to apply the changes
read -p "Do you want to reboot now? (y/n): " reboot_choice

if [ "$reboot_choice" == "y" ]; then
    sudo reboot
else
    echo "Please remember to reboot your system to apply the changes."
fi
