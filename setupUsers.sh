#!/bin/bash

#create star-web group
sudo su -c "groupadd -g 160 star-web"

#create tomcat group

sudo su -c "groupadd -g 153 tomcat"


# Add sandbox user
sudo su -c "useradd -r -m -d /share/home/sandbox -s /bin/bash -c \"Cluster UserOne\" -u 111 sandbox"

# Create Tomcat Account on compute nodes.
sudo su -c "useradd -r -m -d /home/tomcat -s /bin/bash -c \"Tomcat User\" -u 153 -g 160 tomcat"

# And sandbox user to star-web group
usermod -aG star-web sandbox

#configure Backend.WorkingDir
sudo mkdir /export
sudo mkdir /export/starexec
sudo mkdir /export/starexec/sandbox
sudo chown -R tomcat:star-web /export/starexec
#sudo chgrp -R star-web /export/starexec

#next 4 lines to configure sandbox directory
mkdir -p /local/sandbox

sudo chown sandbox:sandbox /local/sandbox/

sudo chmod 770 /local/sandbox/

sudo chmod g+s /local/sandbox/

# Add tomcat account to star-web group
usermod -aG star-web tomcat

# Add starexec account to star-web grp
usermod -aG star-web starexec

# Add starexec account to tomcat grp
usermod -aG tomcat starexec

usermod -aG sandbox tomcat
