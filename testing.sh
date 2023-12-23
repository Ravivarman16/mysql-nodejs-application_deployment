#!/bin/bash
set -e  # Exit script if any command returns a non-zero status

#1. Updating the operating system:
apt-get update

#2. Installing java:
apt-get install -y openjdk-17-jre

#3. Installing jenkins:
sudo wget -O /usr/share/keyrings/jenkins-keyring.asc \
  https://pkg.jenkins.io/debian-stable/jenkins.io-2023.key
echo deb [signed-by=/usr/share/keyrings/jenkins-keyring.asc] \
  https://pkg.jenkins.io/debian-stable binary/ | sudo tee \
  /etc/apt/sources.list.d/jenkins.list > /dev/null
apt-get update
apt-get install jenkins -y 

#4. Installing docker:
apt-get install -y docker.io
chmod 777 /var/run/docker.sock

#5. Installing nodejs:
cd ~
curl -sL https://deb.nodesource.com/setup_16.x -o /tmp/nodesource_setup.sh
sudo bash /tmp/nodesource_setup.sh
sudo apt-get install -y nodejs

#6. installing mysql:
apt install mysql-client-core-8.0 -y 


