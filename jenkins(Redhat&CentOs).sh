#! /bin/bash
yum update -y
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo # jenkins reposuna ulasim bilgileri aliyouruz
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io.key # repoya erismek icin gerekli key'i aliyourz
yum upgrade
amazon-linux-extras install java-openjdk11 
amazon-linux-extras install epel -y
yum install jenkins -y
systemctl daemon-reload 
systemctl enable jenkins
systemctl start jenkins
yum install git -y