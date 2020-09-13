#!/bin/bash

mysql -u root -p -e "CREATE DATABASE starexec; GRANT ALL PRIVILEGES ON starexec.* TO 'se_admin'@'localhost' IDENTIFIED BY 'dfsdf34RFerfg3TFGRfrF3edFVg12few2'; FLUSH PRIVILEGES;"

echo "made starexec database"

