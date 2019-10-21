#!/usr/bin/env bash

# Set to noninteractive
DEBIAN_FRONTEND=noninteractive

# Update / Upgrade
sudo -E apt-get update
sudo -E apt-get -y upgrade

echo -e "\e[32mUpgrade Complete\e[0m"

# Install apache php
sudo -E apt-get install -y apache2
sudo -E apt-get install -y php

echo -e "\e[32mApache/PHP Install Complete\e[0m"

# Install extra php stuff
sudo -E apt-get install -y php-xml
sudo -E apt-get install -y php-gd
sudo -E apt-get install -y php.mbstring
sudo -E apt-get install -y php-json

echo -e "\e[32mExtra PHP Stuff Install Complete\e[0m"

# Install misc
sudo -E apt-get install -y vim

echo -e "\e[32mMisc Install Complete\e[0m"

# Set permissions for bludit install
sudo -E chown -R www-data: /var/www/html

echo -e "\e[32mPermissions Update Complete\e[0m"

# Enable mod_rewrite
sudo -E a2enmod rewrite

echo -e "\e[32mEnable mod_rewrite Complete\e[0m"

# Update Apache conf
sudo -E echo '<Directory /var/www/html/example.com/public_html>' >> /etc/apache2/sites-available/000-default.conf
sudo -E echo '    Options Indexes FollowSymLinks' >> /etc/apache2/sites-available/000-default.conf
sudo -E echo '    AllowOverride All' >> /etc/apache2/sites-available/000-default.conf
sudo -E echo '    Require all granted' >> /etc/apache2/sites-available/000-default.conf
sudo -E echo '</Directory>

echo -e "\e[32mUpdated Apache conf Complete\e[0m"

# Restart Apache
sudo -E service apache2 restart

echo -e "\e[32mApache Restart Complete\e[0m"
