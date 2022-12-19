#!/bin/bash

# Defining Variables
PACKAGES="httpd wget unzip"
SERVICE="httpd"
TMP="/tmp/webfiles"
URL="https://www.tooplate.com/zip-templates/2108_dashboard.zip"
ARTIFACT="2108_dashboard.zip"


# Installing Dependencies
echo "#############################################"
echo "Installing Packages"
echo "#############################################"
yum install $PACKAGES -y > /dev/null
echo 

# starting services
echo "##############################################"
echo " Enable httpd services"
echo "##############################################"
systemctl start $SERVICE
systemctl enable $SERVICE
echo

# Creating Temp Directory
echo "##############################################"
echo "Temp Directory"
echo "##############################################"
mkdir -p $TMP
cd $TMP
echo

# Downloading Artifacts
echo "##############################################"
echo "Download Artifacts"
echo "##############################################"
wget $URL > /dev/null
unzip $ARTIFACT > /dev/null
cp -rf ./2108_dashboard/* /var/www/html/
echo 

# Restart Sevices
echo "##############################################"
echo " Restart httpd service"
echo "##############################################" 
systemctl restart $SERVICE
echo

# Cleanup Temp files
echo "##############################################"
echo " Cleaning up temp directory "
echo "##############################################"
rm -rf $TMP