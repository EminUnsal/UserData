#! /bin/bash

yum update -y
amazon-linux-extras install nginx1
systemctl start nginx
cd /usr/share/nginx/html
chmod -R 777 /usr/share/nginx/html  # or chmod 777 index.hmtl 
# This isnt best practice
rm index.html
wget <Pull your files index.hmtl>
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/index.html
wget https://raw.githubusercontent.com/awsdevopsteam/route-53/master/ken.jpg
systemctl restart nginx
systemctl enable ngnix