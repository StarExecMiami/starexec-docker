#!/bin/bash

#rm -rf /var/lib/mysql/*

#usr/libexec/mariadb-prepare-db-dir mariadb.service

/usr/bin/mysqld_safe --basedir=/usr &

/project/apache-tomcat-7/bin/catalina.sh run & 

sleep 10

sudo mysql -u root -e "DROP DATABASE IF EXISTS starexec; CREATE DATABASE starexec; GRANT ALL PRIVILEGES ON starexec.* TO 'se_admin'@'localhost' IDENTIFIED BY 'dfsdf34RFerfg3TFGRfrF3edFVg12few2'; FLUSH PRIVILEGES;"

#echo "newinstall.sql"

#mysql - u root starexec < NewInstall.sql

bash /DeployApp.sh
bash ./DeployApp.sh

echo "SUCCESS!!! GO TO YOUR BROWSER AND TYPE IN: localhost:portNumber"

echo "username: admin"
echo "password: admin"

sleep infinity
