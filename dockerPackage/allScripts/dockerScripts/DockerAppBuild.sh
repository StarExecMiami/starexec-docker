#!/bin/bash
set -e
set -o pipefail

#THIS SCRIPT RUNS AT DOCKER BUILD TIME AND JUST MAKES THE APP ALONG WITH VOLUMEDATA (DIRECTORY FOR PERSISTANT DATA)

#starts mysql server
/usr/bin/mysqld_safe --basedir=/usr --user=mysql &

#starts tomcat server
su -c "/project/apache-tomcat-7/bin/catalina.sh run &" tomcat

sleep 10 

sudo mysql -u root -e "DROP DATABASE IF EXISTS starexec; CREATE DATABASE starexec; GRANT ALL PRIVILEGES ON starexec.* TO 'se_admin'@'localhost' IDENTIFIED BY 'dfsdf34RFerfg3TFGRfrF3edFVg12few2'; FLUSH PRIVILEGES;"


bash allScripts/starexecScripts/AntBuildDeploy.sh
