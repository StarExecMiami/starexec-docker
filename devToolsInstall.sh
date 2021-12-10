


sudo yum install -y centos-release-scl

sudo yum-config-manager --enable rhel-server-rhscl-7-rpms

sudo yum install -y devtoolset-7

scl enable devtoolset-7 bash
