#! /bin/bash
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu bionic test"
sudo apt install docker-ce


# If you want to run docker as non-root user then you need to add it to the docker group.
# sudo groupadd docker #Create the docker group if it does not exist
# sudo usermod -aG docker $USER #Add your user to the docker group
# newgrp docker #Run the following command or Logout and login again and run