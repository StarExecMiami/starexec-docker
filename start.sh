#!/bin/bash

#RUNS AT DOCKER RUN TIME AND IS RESPONSIBLE FOR SOFT DEPLOY

#starts mysql server
/usr/bin/mysqld_safe --basedir=/usr &

#starts tomcat server
/project/apache-tomcat-7/bin/catalina.sh run & 

sleep 10 #to give some time for servers to start up

cd ~starexec/StarExec-deploy

script/soft-deploy.sh && printf "SUCCESS!!! GO TO YOUR BROWSER AND TYPE IN: localhost:portNumber \nusername: admin \npassword: admin"

sleep infinity
