#!/bin/bash

#installs sass with nodejs package manager

echo "Downloading nodejs"

sudo yum install -y gcc-c++ make

curl -sL https://rpm.nodesource.com/setup_14.x | sudo -E bash -

#sudo yum install -y epel-release

sudo yum install -y nodejs npm

echo "Done, Now installing sass"

npm install -g -y  sass 

echo "Done"
