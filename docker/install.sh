#!bin/bash
# docker + compsoe install script
#for ubuntu/debian

#fix hostname if necessary
#echo "127.0.1.1 $HOSTNAME" > /etc/hosts

usermod -aG docker ${USER}

sudo apt-get update
sudo apt-get install    -y  apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo apt-key fingerprint 0EBFCD88
sudo add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu  $(lsb_release -cs)    stable"
sudo apt-get update
sudo apt-get install -y docker-ce

sudo curl -L "https://github.com/docker/compose/releases/download/1.23.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +rx /usr/local/bin/docker-compose
