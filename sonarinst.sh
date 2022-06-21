#!/bin/bash

#Author: Tyriq Martin
#Date: 6/20/2022
#Description: Script for Sonarqube installation on centos/7

# Java 11 installation
sudo yum update -y

if [ $? -ne 0 ]
then
echo "yum update failed"
exit 1
fi

sudo yum install java-11-openjdk-devel -y

if [ $? -ne 0 ]
then
echo "java-11-openjdk-devel installation failed."
exit 1
fi

sudo yum install java-11-openjdk -y

if [ $? -ne 0 ]
then
echo "java-11-openjdk installation failed"
exit 1
fi

# Download SonarQube latest versions on your server
# cd into opt before installing
cd /opt

if [ $? -ne 0 ]
then
echo "failed to cd into /opt"
exit 1
fi

sudo yum install wget -y

if [ $? -ne 0 ]
then
echo "wget installation failed."
exit 1
fi

sudo wget https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip

if [ $? -ne 0 ]
then
echo "wget of 'https://binaries.sonarsource.com/Distribution/sonarqube/sonarqube-9.3.0.51899.zip' failed. "
exit 1
fi

# Extract packages
sudo yum install unzip -y

if [ $? -ne 0 ]
then
echo "unzip installation failed"
exit 1
fi

sudo unzip /opt/sonarqube-9.3.0.51899.zip

if [ $? -ne 0 ]
then
echo "unzip of /opt/sonarqube-9.3.0.51899.zip failed"
exit 1
fi

# Change ownership and switch to Linux binaries directory to start service
sudo chown -R vagrant:vagrant /opt/sonarqube-9.3.0.51899

if [ $? -ne 0 ]
then
echo "chown -R command failed"
exit 1
fi

cd /opt/sonarqube-9.3.0.51899/bin/linux-x86-64

if [ $? -ne 0 ]
then
echo "failed to cd into /opt/sonarqube-9.3.0.51899/bin/linux-x86-64"
exit 1
fi

./sonar.sh start

if [ $? -ne 0 ]
then
echo "failed to start sonar"
exit 1
fi

