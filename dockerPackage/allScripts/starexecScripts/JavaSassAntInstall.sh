#!/bin/bash
set -e
set -o pipefail

#installs java-1.8.0

echo "Installing java openjdk"

sudo yum install -y java-1.8.0-openjdk
sudo yum install -y  java-1.8.0-openjdk-devel

#installs ant
echo "Installing Ant"

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/ant-junit-1.9.4-2.el7.noarch.rpm

sudo yum install -y ant-junit-1.9.4-2.el7.noarch.rpm

#installs sass with nodejs package manager

echo "Downloading nodejs"

sudo yum install -y gcc-c++ make

curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -

sudo yum install -y nodejs npm

echo "Done, Now installing sass"

npm install -g -y  sass


