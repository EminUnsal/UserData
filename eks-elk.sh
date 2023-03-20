#! /bin/bash
yum update -y
# Install kubectl
curl -o kubectl https://s3.us-west-2.amazonaws.com/amazon-eks/1.22.6/2022-03-09/bin/linux/amd64/kubectl
chmod +x ./kubectl
mkdir -p $HOME/bin && cp ./kubectl $HOME/bin/kubectl && export PATH=$PATH:$HOME/bin 
# PATH degiskenine ekliyoruz kubectl'i
echo 'export PATH=$PATH:$HOME/bin' >> ~/.bashrc  # bu komudun amaci, terminal degisse bile path degiskenini alabilsin diye
# Install eksctl
curl --silent --location "https://github.com/weaveworks/eksctl/releases/download/v0.111.0/eksctl_Linux_amd64.tar.gz" | tar xz -C /tmp
mv /tmp/eksctl /usr/local/bin 
# usr/local/bin execute path oldugu icin eksctl'i oraya ekledim.bu saydece komut her yerden gorulebilir
# Creating the Kubernetes Cluster on EKS
ssh-keygen -f ~/.ssh/id_rsa 
# bu komutla .ssh'in altinda kendi key pair'imizi olusuturyoruz,id-rsa(bu bizde),id-rsa.pub(bunu ise actigi bilgisayara gonderiyor) seklinde.amazon zaten bu sekilde calisiyor bizdeki FIrst_Key gibi.bu komutla eks'de olusan nodlara id-rsa.pub gonderiyoruz
eksctl create cluster \
 --name mehmet-elk \
 --region us-east-1 \
 --zones us-east-1a,us-east-1b,us-east-1c \
 --nodegroup-name my-nodes \
 --node-type t3a.medium \
 --nodes 2 \
 --nodes-min 2 \
 --nodes-max 3 \
 --ssh-access --ssh-public-key  ~/.ssh/id_rsa.pub \
 --managed
# NOT:Ssh access olsun diyorum,ihtiyac halinde node'lara baglanabilmek icin.diger komutla da nodelara baglanabilmek icin onlarin icine public keylerimizi yolluyoruz
# Not: Tewrraform file'de "administration role" verdigimiz icin instance'a, ssh-keygen komutundan sonra ne aws configure nede IAM role atamamiza gerek kalmiyor.Eger aws configure komutu girdiysek region belirtmemize gerek yok eks cluster kurarkenki komutta,ama iam role atamissak o zaman region belirtmemiz gerekiuyor.
# Steps to Install Helm
curl https://raw.githubusercontent.com/helm/helm/master/scripts/get-helm-3 | bash # elk chart icin
# Install EFK stack in EKS cluster 
kubectl create ns efk
helm repo add elastic https://helm.elastic.co
helm repo update