#!/bin/bash


# Author: Tyriq Martin
# Date: 6/27/2022
# Description: System inventory script

echo "System inventory loading...."
sleep 2

# CPU
echo "---------------CPU---------------"
lscpu

sleep 2

if [ $? -ne 0 ]
then
echo "lscpu command failed"
exit 1
fi

# Number of CPU
echo "---------------Number of CPU---------------"
nproc

sleep 2

if [ $? -ne 0 ]
then
echo "nproc command failed"
exit 2
fi

# Memory
echo "---------------Memory---------------"
free -m

sleep 2

if [ $? -ne 0 ]
then
echo "free -m command failed"
exit 3
fi

# Hard drive
echo "---------------Hard drive info---------------"
lsblk

sleep 2

if [ $? -ne 0 ]
then
echo "lsblk command failed"
exit 4
fi

# Operating system
echo "---------------Operating system info---------------"
cat /etc/os-release

sleep 2

if [ $? -ne 0 ]
then
echo "cat command failed"
exit 5
fi

# Kernel
echo "---------------Kernel info---------------"
uname -a

sleep 2

if [ $? -ne 0 ]
then
echo "uname -a command failed"
exit 6
fi


