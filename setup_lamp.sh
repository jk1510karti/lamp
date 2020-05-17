#!/bin/bash
#*****************************************************#
# This script is developed only for the test purposes #
#*****************************************************#
# Script to install LAMP stack on CentOS8
# The database either can be MariaDB/MySQL.
# Update the yum repo
sudo yum repo

# Install apache, php and mariaDB
sudo yum install httpd mariadb-server mariadb php php-mysqlnd -y

# Start all the services
sudo systemctl enable httpd
sudo systemctl start httpd
sudo systemctl enable mariadb
sudo systemctl start mariadb # Root user password reset setup is not done yet

# Restart the appserver
sudo systemctl restart httpd
sudo systemctl start firewalld

# Enable firewal rule for both http and https. Just in case if we have to enable SSL later
sudo firewall-cmd --permanent --zone=public --add-service=http
sudo firewall-cmd --permanent --zone=public --add-service=https
sudo firewall-cmd --reload

# Create test webpage
sudo echo "Hello World" > /var/www/html/index.html
