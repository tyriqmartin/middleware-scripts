#!/bin/bash

#Author: Tyriq Martin
#Date: 6/25/2022
#Description: Jenkins installation sript on a Centos server.

# Install Java
sudo yum install java-1.8.0-openjdk-devel -y

if [ $? -ne 0 ]
then 
echo "Java installation failed"
exit 1
fi

# Enable the Jenkins repository
sudo wget -O /etc/yum.repos.d/jenkins.repo http://pkg.jenkins-ci.org/redhat/jenkins.repo

if [ $? -ne 0 ]
then 
sudo yum install wget -y
fi

if [ $? -ne 0 ]
then 
echo "wget command failed"
exit 2
fi

# Disable key check on the repo
sudo sed -i 's/gpgcheck=1/gpgcheck=0/g' /etc/yum.repos.d/jenkins.repo

if [ $? -ne 0 ]
then 
echo "sed command failed"
exit 3
fi

# Install the latest version of jenkins
sudo yum install jenkins -y

if [ $? -ne 0 ]
then 
echo "Jenkins installation failed"
exit 4
fi

# Start Jenkins
sudo systemctl start jenkins 

if [ $? -ne 0 ]
then 
echo "There was a problem starting jenkins"
exit 5
fi

# Enable Jenkins
sudo systemctl enable jenkins

if [ $? -ne 0 ]
then 
echo "There was a problem enabling jenkins"
exit 6
fi

# Adjust firewall 
sudo firewall-cmd --permanent --zone=public --add-port=8080/tcp 

sudo firewall-cmd --reload

if [ $? -ne 0 ]
then 
echo "There was a problem adjusting the firewall"
exit 7
fi

echo "---------------INSTALLATION COMPLETE---------------"

# Open jenkins in the browser
echo "Open Jenkins page in the browser"
echo "http://your_ip_or_domain:8080"

# Admin password
echo "Here is the admin password:"
sudo cat /var/lib/jenkins/secrets/initialAdminPassword


