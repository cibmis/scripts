#!/bin/bash

#Make sure that we have all of our updates
sudo apt-get update
sudo apt-get upgrade

#install Apache
sudo apt-get install apache2
sudo a2enmod ssl
sudo a2enmod include

#Setup Directors for websites
sudo mkdir -p /data/www/avebank.com
sudo mkdir -p /data/www/marinebank.com
sudo mkdir -p /data/www/centralillinoisbank.com
sudo mkdir -p /data/www/cibmbank.com

#Setup appropriate rights to folders
sudo chmod -R 755 /data/www

#Clone websites from Github
sudo git clone https://github.com/cibmis/cib.git /data/www/centralillinoisbank.com
sudo git clone https://github.com/cibmis/ave.git /data/www/avebank.com
sudo git clone https://github.com/cibmis/marine.git /data/www/marinebank.com
sudo git clone https://github.com/cibmis/cibm.git /data/www/cibmbank.com

sudo chmod +x /data/www/centralillinoisbank.com/*.html
sudo chmod +x /data/www/avebank.com/*.html
sudo chmod +x /data/www/marinebank.com/*.html
