#!/bin/bash

#installs java-1.8.0

echo "Installing java openjdk"

sudo yum install java-1.8.0-openjdk
sudo yum install java-1.8.0-openjdk-devel

echo "Done"

#installs ant
echo "Installing Ant"

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/ant-junit-1.9.4-2.el7.noarch.rpm

sudo yum install ant-junit-1.9.4-2.e17.noarch.rpm

echo "Done"

