#!/bin/bash

#installs ant
echo "Installing Ant"

wget http://mirror.centos.org/centos/7/os/x86_64/Packages/ant-junit-1.9.4-2.el7.noarch.rpm

sudo yum install -y ant-junit-1.9.4-2.el7.noarch.rpm

echo "Done"

