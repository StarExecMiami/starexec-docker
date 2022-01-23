#!/bin/bash

#installs mariadb and configures it

echo "Installing mariadb"

sudo yum install -y mariadb mariadb-server

/usr/bin/mysqld_safe --basedir=/usr #starts mariadb

sudo ln -s /etc/systemd/system/multi-user.target.wants/mariadb.service /usr/lib/systemd/system/mariadb.service


#sudo mysql_secure_installation

mysql -u root --version

#configures mariadb db directory
sudo ls -al /var/lib/mysql
sudo rm -rf /var/lib/mysql/*

usr/libexec/mariadb-prepare-db-dir mariadb.service

echo "Done installing MariaDB"
