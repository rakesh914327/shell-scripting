#!/bin/bash

# Installing Dependencies
echo "#############################################"
echo "Installing Packages"
echo "#############################################"
sudo yum install wget unzip httpd -y > /dev/null
echo 

# starting services
echo "##############################################"
echo " Enable httpd services"
echo "##############################################"
sudo systemctl start httpd
sudo systemctl enable httpd
echo

# Creating Temp Directory
echo "##############################################"
echo "Temp Directory"
echo "##############################################"
mkdir -p /tmp/webfiles
cd /tmp/webfiles
echo

# Downloading Artifacts
echo "##############################################"
echo "Download Artifacts"
echo "##############################################"
wget https://www.tooplate.com/zip-templates/2108_dashboard.zip > /dev/null
unzip 2108_dashboard.zip > /dev/null
sudo cp -rf ./2108_dashboard/* /var/www/html/
echo 

# Restart Sevices
echo "##############################################"
echo " Restart httpd service"
echo "##############################################"
sudo systemctl restart httpd
echo

# Cleanup Temp files
echo "##############################################"
echo " Cleaning up temp directory "
echo "##############################################"
rm -rf /tmp/webfiles
