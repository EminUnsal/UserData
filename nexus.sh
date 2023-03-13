#! /bin/bash
yum update -y
yum install java-1.8.0-openjdk -y
# install Maven--> bu kisim zorunlu degil sadece nexusu test etmek icin maven reposundan 
wget https://repos.fedorapeople.org/repos/dchen/apache-maven/epel-apache-maven.repo -O /etc/yum.repos.d/epel-apache-maven.repo
sed -i s/\$releasever/7/g /etc/yum.repos.d/epel-apache-maven.repo
sudo yum install apache-maven -y
# install Nexus
cd /opt
wget -O nexus.tar.gz https://download.sonatype.com/nexus/3/latest-unix.tar.gz
tar xvzf nexus.tar.gz
rm nexus.tar.gz
mv nexus-3* nexus
chown -R ec2-user:ec2-user /opt/nexus
chown -R ec2-user:ec2-user /opt/sonatype-work
echo "run_as_user=ec2-user" > /opt/nexus/bin/nexus.rc
export PATH=$PATH:/opt/nexus/bin
nexus start