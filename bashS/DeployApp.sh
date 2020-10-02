#!/bin/bash


firefox http://localhost:8080/manager

#how do we add the username and password?

cd ~tomcat/StarExec-deploy/sql

mysql -u root starexec < NewInstall.sql


cd ~tomcat/StarExec-deploy

ant build -buildfile build.xml reload-sql update-sql

echo "done"
