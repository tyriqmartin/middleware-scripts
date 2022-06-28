#!/bin/bash


# Author: Tyriq Martin
# Date: 6/27/2022
# Description: Docker installation on Centos7

# Clean up the system
sudo yum remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-engine -y

if [ $? -ne 0 ]
then
echo "yum remove failed"
exit 1
fi

# Setup the docker repository
sudo yum install -y yum-utils

if [ $? -ne 0 ]
then
echo "yum install failed"
exit 2
fi

sudo yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo

if [ $? -ne 0 ]
then
echo "yum-config-manager failed"
exit 3
fi

# Install the docker engine
sudo yum install docker-ce docker-ce-cli containerd.io -y

if [ $? -ne 0 ]
then
echo "yum install failed"
exit 4
fi

# Start and enable the docker daemon
sudo systemctl start docker

if [ $? -ne 0 ]
then
echo "Failed to start docker daemon"
exit 5
fi

sudo systemctl enable docker

if [ $? -ne 0 ]
then
echo "Failed to enable docker daemon"
exit 6
fi

echo "---------------DOCKER PROCESS COMPLETE----------------"

