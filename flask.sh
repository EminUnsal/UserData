#! /bin/bash

yum update -y
yum install python3 -y
pip3 install flask
yum install git wget -y
# cd /home/ec2-user
# wget https://raw.githubusercontent.com/EminUnsal/MyProjects/main/python/flask-01-02-hello-world-app-jinja-template/flask-03-MyCity/mycity.py
# mkdir /home/ec2-user/templates
# cd /home/ec2-user/templates
# wget https://raw.githubusercontent.com/EminUnsal/MyProjects/main/python/flask-01-02-hello-world-app-jinja-template/flask-03-MyCity/templates/body.html
# wget https://raw.githubusercontent.com/EminUnsal/MyProjects/main/python/flask-01-02-hello-world-app-jinja-template/flask-03-MyCity/templates/index.html
# mkdir /home/ec2-user/static
# cd /home/ec2-user/static
# wget https://github.com/EminUnsal/MyProjects/blob/main/python/flask-01-02-hello-world-app-jinja-template/flask-03-MyCity/static/lu.jpg
# wget https://github.com/EminUnsal/MyProjects/blob/main/python/flask-01-02-hello-world-app-jinja-template/flask-03-MyCity/static/rg.jpg