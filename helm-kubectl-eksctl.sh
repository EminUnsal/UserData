#helm install
curl -sSL https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3
#kubectl install
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.23.7/2022-06-29/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc
#eksctl install
curl --silent --location "https://github.com/weaveworks/eksctl/releases/latest/download/eksctl_$(uname -s)_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin
#awsconfigure
ssh-keygen -f ~/.ssh/id_rsa
#eks-cluster
eksctl create cluster \
 --name cwcluster \
 --version 1.23 \
 --region us-east-1 \
 --zones us-east-1a,us-east-1b,us-east-1c \
 --nodegroup-name my-nodes \
 --node-type t3a.medium \
 --nodes 1 \
 --nodes-min 1 \
 --nodes-max 2 \
 --ssh-access \
 --ssh-public-key  ~/.ssh/id_rsa.pub \
 --managed
#Note that the default value for node-type is m5.large.