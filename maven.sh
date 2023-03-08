sudo yum update -y
sudo yum install java-11-amazon-corretto -y
sudo su
cd /opt
rm -rf maven
wget https://dlcdn.apache.org/maven/maven-3/3.8.7/binaries/apache-maven-3.8.7-bin.tar.gz
tar -zxvf $(ls | grep apache-maven-*-bin.tar.gz)
rm -rf $(ls | grep apache-maven-*-bin.tar.gz)
sudo ln -s $(ls | grep apache-maven*) maven
echo 'export M2_HOME=/opt/maven' > /etc/profile.d/maven.sh
echo 'export PATH=${M2_HOME}/bin:${PATH}' >> /etc/profile.d/maven.sh
exit
source /etc/profile.d/maven.sh

# For Jenkins GUI Configuration
# - Open Jenkins GUI on web browser

# - Setting System Maven Path for default usage
  
# - Go to `Manage Jenkins`
#   - Select `Configure System`
#   - Find `Environment variables` part,
#   - Click `Add`
#     - for `Name`, enter `PATH+EXTRA` 
#     - for `Value`, enter `/opt/maven/bin`
# - Save

# - Setting a specific Maven Release in Jenkins for usage
  
# - Go to the `Global Tool Configuration`
# - To the bottom, `Maven` section
#   - Give a name such as `maven-3.8.7`
#   - Select `install automatically`
#   - `Install from Apache` version `3.8.7`
# - Save
