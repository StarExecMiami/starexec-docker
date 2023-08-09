#!/bin/bash
set -e
set -o pipefail

yum -y update && yum -y upgrade
yum install -y sudo git wget unzip file httpd mod_ssl scl-utils tcsh

#installs devTools for centos
sudo yum install -y centos-release-scl
sudo yum-config-manager --enable rhel-server-rhscl-7-rpms
sudo yum install -y devtoolset-7
scl enable devtoolset-7 bash

#installs and compiles openSSL
wget --no-check-certificate https://www.openssl.org/source/openssl-1.0.2g.tar.gz -O - | tar -xz
cd ./openssl-1.0.2g && ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl && pwd && ls -la /bin/make && /bin/make install && cd ../


#creates SSL cetificiate for localhost for https 
bash ./allScripts/osScripts/SSLCreateLocalhost.sh



# nslookup
sudo yum install -y bind-utils
