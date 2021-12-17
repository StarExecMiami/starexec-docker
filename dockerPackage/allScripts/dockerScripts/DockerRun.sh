#!/bin/bash

#RUNS AT DOCKER RUN TIME AND IS RESPONSIBLE FOR SOFT DEPLOY

#start apache2 server

/usr/sbin/httpd

#starts mysql server
/usr/bin/mysqld_safe --basedir=/usr --user=mysql &

#starts tomcat server
su -c "/project/apache-tomcat-7/bin/catalina.sh run &" tomcat

sleep 10 #to give some time for servers to start up

cd ~starexec/StarExec-deploy

script/soft-deploy.sh && printf "SUCCESS!!! GO TO YOUR BROWSER AND TYPE IN: localhost:portNumber \nusername: admin \npassword: admin"

sleep infinity
