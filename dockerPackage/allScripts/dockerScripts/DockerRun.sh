#!/bin/bash
set -e
set -o pipefail

#RUNS AT DOCKER RUN TIME AND IS RESPONSIBLE FOR SOFT DEPLOY

chown -R tomcat:star-web /project
chown -R tomcat:star-web /home/starexec
chown -R tomcat:star-web /home/sandbox
chown -R mysql:mysql /var/lib/mysql
chmod 755 -R /home/starexec

#start apache2 server

/usr/sbin/httpd

#starts mysql server
/usr/bin/mysqld_safe --basedir=/usr --user=mysql &

#starts tomcat server
/project/apache-tomcat-7/bin/catalina.sh run &

sleep 10 #to give some time for servers to start up

cd ~starexec/StarExec-deploy

script/soft-deploy.sh && printf "SUCCESS!!! GO TO YOUR BROWSER AND TYPE IN: localhost:portNumber \nusername: admin \npassword: admin"

sleep infinity
