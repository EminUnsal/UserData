#! /bin/bash

yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
sudo chmod -R 777 /var/www/html
echo 'Hello Everyone.This is my WebSite' > /var/www/html/index.html
sudo systemctl restart httpd

