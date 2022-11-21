#! /bin/bash
yum update -y
amazon-linux-extras install docker
service docker start
sudo usermod -a -G docker ec2-user