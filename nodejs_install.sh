#!/bin/sh

# install docker
sudo yum update -y 
sudo amazon-linux-extras install docker -y 
sudo service docker start 
sudo usermod -a -G docker ec2-user

# install docker-compose
sudo curl -L https://github.com/docker/compose/releases/download/1.25.4/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# install git 
sudo yum install git -y

# git clone repo
git clone https://github.com/worzwhere/nodejsapp.git nodeapp
cd nodeapp
git clone https://github.com/CleverCloud/demo-nodejs-mongodb-rest.git app
docker-compose build
docker-compose up -d