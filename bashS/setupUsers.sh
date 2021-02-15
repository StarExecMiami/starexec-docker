#!/bin/bash

#create star-web group
sudo su -c "groupadd -g 160 star-web"
# Add sandbox user
sudo su -c "useradd -r -m -d /share/home/sandbox -s /bin/bash -c \"Cluster UserOne\" -u 111 sandbox"
# And sandbox user to star-web group
usermod -aG star-web sandbox

#next 4 lines to configure sandbox directory
mkdir -p /local/sandbox

sudo chown sandbox:sandbox /local/sandbox/

sudo chmod 770 /local/sandbox/

sudo chmod g+s /local/sandbox/


# Create Tomcat Account on compute nodes.
sudo su -c "useradd -r -m -d /home/tomcat -s /bin/bash -c \"Tomcat User\" -u 153 -g 160 tomcat"
# And tomcat aacount to star-web group
usermod -aG star-web tomcat

#configure Backend.WorkingDir

sudo mkdir /export/starexec
sudo mkdir /export/starexec/sandbox
sudo chown -R tomcat:star-web /export/starexec