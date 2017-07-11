#!/bin/bash

#Make sure that we have all of our updates
sudo apt-get update
sudo apt-get upgrade

#install Apache
sudo apt-get install apache2
sudo a2enmod ssl
sudo a2enmod include

#Setup Directors for websites
sudo mkdir -p /var/www/avebank.com
sudo mkdir -p /var/www/marinebank.com
sudo mkdir -p /var/www/centralillinoisbank.com
sudo mkdir -p /var/www/cibmbank.com

#Setup appropriate rights to folders
sudo chmod -R 755 /data/www

#Clone websites from Github
sudo git clone https://github.com/cibmis/cib.git /var/www/centralillinoisbank.com
sudo git clone https://github.com/cibmis/ave.git /var/www/avebank.com
sudo git clone https://github.com/cibmis/marine.git /var/www/marinebank.com
sudo git clone https://github.com/cibmis/cibm.git /var/www/cibmbank.com

sudo chmod +x /var/www/centralillinoisbank.com/*.html
sudo chmod +x /var/www/avebank.com/*.html
sudo chmod +x /var/www/marinebank.com/*.html
sudo chmod +x /var/www/cibmbank.com/*.html

sudo git clone https://github.com/cibmis/wwwconfig ~/config
sudo cp ~/config/apache2.conf /etc/apache2/apache2.conf
sudo mkdir /etc/apache2/ssl
sudo cp ~/config/certs/* /etc/apache2/ssl/.
sudo cp ~/config/*bank.com.conf /etc/apache2/sites-available/.
sudo a2ensite avebank.com.conf
sudo a2ensite centralillinoisbank.com.conf
sudo a2ensite marinebank.com.conf
sudo a2ensite cibmbank.com.conf