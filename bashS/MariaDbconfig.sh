#!/bin/bash

#installs mariadb and configures it

echo "Installing mariadb"

sudo yum install -y mariadb mariadb-server

sudo systemctl start mariadb

sudo systemctl enable mariadb

sudo ln -s /etc/systemd/system/multi-user.target.wants/mariadb.service /usr/lib/systemd/system/mariadb.service

echo "TYPE 'y' AND PRESS RETURN FOR EACH PROMPT"

sudo mysql_secure_installation


echo "add password to /root/.my.cnf"


mysql -u root --version

echo "Done installing MariaDB"
