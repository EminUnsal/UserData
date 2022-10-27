#! /bin/bash

yum update -y
yum install httpd -y
systemctl start httpd
systemctl enable httpd
sudo chmod -R 777 /var/www/html
echo 'Hello Everyone.This is my WebSite' > /var/www/html/index.html
sudo systemctl restart httpd

# #! /bin/bash
# yum update -y
# yum install -y httpd
# TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
# && PRIVATE_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/local-ipv4`
# TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
# && PUBLIC_IP=`curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4` 
# DATE_TIME=`date`
# chmod -R 777 /var/www/html
# echo "<html>
# <head>
#     <title> Congratulations! You have created an instance from Launch Template</title>
# </head>
# <body>
#     <h1>This web server is launched from launch template by Mehmet Emin</h1>
#     <p>This instance is created at <b>$DATE_TIME</b></p>
#     <p>Private IP address of this instance is <b>$PRIVATE_IP</b></p>
#     <p>Public IP address of this instance is <b>$PUBLIC_IP</b></p>
# </body>
# </html>" > /var/www/html/index.html
# systemctl start httpd
# systemctl enable httpd