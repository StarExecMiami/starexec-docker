#!/bin/bash

#this script configures all of tomcat7 application manager for starexec

#We begin by unzipping tomcat from starexec repo

echo "unzipping tomcat7 from starexec repo clone"

#makes project folder and installs tomcat on it

echo "making directory for project"

sudo mkdir /project

cd /project

echo "installing tomcat and changing ownership"

sudo unzip ~starexec/StarExec-deploy/distribution/apache-tomcat-7.0.64.zip

sudo ln -s /project/apache-tomcat-7.0.64 /project/apache-tomcat-7

sudo chown -R tomcat:tomcat /project/apache-tomcat-7.0.64

echo "Done unzipping"

#downloads latest tomcat 7 distribution

echo "getting and downloading latest version of tomcat7"

wget https://archive.apache.org/dist/tomcat/tomcat-7/v7.0.94/bin/apache-tomcat-7.0.94.tar.gz

cd /project

sudo tar -xzvf apache-tomcat-7.0.94.tar.gz

sudo cp /project/apache-tomcat-7.0.64/lib/drmaa.jar /project/apache-tomcat-7.0.94/lib/

sudo cp /project/apache-tomcat-7.0.64/lib/mysql-connector-java-5.1.22-bin.jar /project/apache-tomcat-7.0.94/lib/

sudo chown -R tomcat:tomcat /project/apache-tomcat-7.0.94

ln -s /project/apache-tomcat-7.0.94 /project/apache-tomcat-7

chmod 744 /project/apache-tomcat-7/bin/*.sh

echo "Done downloading tomcat7"

#make tomcat7 statup script

echo "Making tomcat7 startup script"

echo "making script" 

touch /etc/systemd/system/tomcat7.service

sudo chmod 744 /etc/systemd/system/tomcat7.service

cat > /etc/systemd/system/tomcat7.service  <<EOF

[Unit]
Description=StarExec Apache Tomcat 7 Servlet Container
After=syslog.target network.target
[Service]
User=tomcat
Group=tomcat
Type=forking
Environment=CATALINA_PID=/var/run/tomcat-7.pid
Environment=CATALINA_HOME=/project/apache-tomcat-7
Environment=CATALINA_BASE=/project/apache-tomcat-7
ExecStart=/project/apache-tomcat-7/bin/startup.sh
ExecStop=/project/apache-tomcat-7/bin/shutdown.sh
Restart=on-failure
[Install]
WantedBy=multi-user.target

EOF


echo "Done making script"

# makes tomcat setenv.sh

echo "creating tomcat7 setenv.sh"

sudo touch /project/apache-tomcat-7/bin/setenv.sh

cd ../

pwd

cat setenv.txt > /project/apache-tomcat-7/bin/setenv.sh

sudo chown tomcat:tomcat /project/apache-tomcat-7/bin/setenv.sh

echo "Done making setenv.sh"


# configures tomcat manager-gui user

echo "configuring tomcat manager-gui user"

sudo touch /project/apache-tomcat-7/conf/tomcat-users.xml

echo '<user username="tomcat" password="TA-passwd" roles="manager-gui"/>' >> /project/apache-tomcat-7/conf/tomcat-users.xml 

echo "go to /project/apache-tomcat-7/conf/tomcat-users.xml for username and password for tomcat"

#start tomcat7 

#echo "starting tomcat7 instance"

#sudo systemctl start tomcat7

#sudo systemctl status tomcat7

#/project/apache-tomcat-7/bin/catalina.sh start

#echo "tomcat 7 started"


echo "Done configuring tomcat7"


