#!/bin/bash


#firefox http://localhost:8080/manager

#how do we add the username and password?

#sudo mysql -u root -e "DROP DATABASE starexec; CREATE DATABASE starexec; GRANT ALL PRIVILEGES ON starexec.* TO 'se_admin'@'localhost' IDENTIFIED BY 'dfsdf34RFerfg3TFGRfrF3edFVg12few2'; FLUSH PRIVILEGES;"


cd ~starexec/StarExec-deploy/sql && mysql -u root starexec < NewInstall.sql


cd ~starexec/StarExec-deploy

if ant build -buildfile build.xml reload-sql update-sql
then 
	echo " "
else
	cd ~starexec/StarExec-deploy/sql && mysql -u root starexec < NewInstall.sql
	cd ~starexec/StarExec-deploy

	if ant build -buildfile build.xml reload-sql update-sql
	then
		echo " "
	else
		echo ERROR! please rerun docker build...
	fi
fi
