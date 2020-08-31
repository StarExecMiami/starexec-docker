#!/bin/bash

#setsup sandboxes, tomcat accounts, star-web groups

sudo useradd -r -m -d /home/sandbox -s /bin/bash -c "Cluster UserOne" -u 111 sandbox

sudo useradd -r -m -d /home/sandbox2 -s /bin/bash -c "Cluster UserTwo" -u 112 sandbox2

sudo su -c "useradd -r -m -d /home/tomcat -s /bin/bash -c \"Tomcat User\" -u 153 -g 160 tomcat"

sudo groupadd -g 160 star-web

sudo chown -R tomcat:star-web /project/apache-tomcat-7


#make setup_users.sh

sudo touch /cluster/scripts/setup_users.sh

sufile = /cluster/scripts/setup_users.sh

cat > $sufile << EOF

#!/bin/bash
# Create star-web group
sudo su -c "groupadd -g 160 star-web"
# Add sandbox and sandbox2 users
sudo su -c "useradd -r -m -d /share/home/sandbox -s /bin/bash -c \"Cluster UserOne\" -u 111 sandbox"
sudo su -c "useradd -r -m -d /share/home/sandbox2 -s /bin/bash -c \"Cluster UserTwo\" -u 112 sandbox2"
# And sandbox and sandbox2 user to star-web group
usermod -aG star-web sandbox
usermod -aG star-web sandbox2
# Create Tomcat Account on compute nodes.  
sudo su -c "useradd -r -m -d /home/tomcat -s /bin/bash -c \"Tomcat User\" -u 153 -g 160 tomcat"
# And tomcat aacount to star-web group
usermod -aG star-web tomcat
usermod -aG star-web tomcat



EOF


#configure sandboxes

mkdir -p /local/sandbox

sudo chown sandbox:sandbox /local/sandbox/

sudo chmod 770 /local/sandbox/

sudo chmod g+s /local/sandbox/


#configure Backend.WorkingDir

sudo mkdir /export/starexec
sudo mkdir /export/starexec/sandbox
sudo mkdir /export/starexec/sandbox2
sudo chown -R tomcat:star-web /export/starexec

echo "Done"
