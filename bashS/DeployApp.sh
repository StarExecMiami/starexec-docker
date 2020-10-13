#!/bin/bash


#firefox http://localhost:8080/manager

#how do we add the username and password?

cd ~starexec/StarExec-deploy/sql && mysql -u root starexec < NewInstall.sql


cd ~starexec/StarExec-deploy && ant build -buildfile build.xml reload-sql update-sql && ~starexec/StarExec-deploy/script/soft-deploy.sh


echo "done"
