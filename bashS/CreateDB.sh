
#!/bin/bash

echo "TYPE THESE IN WHEN PROMPTED

DROP DATABASE starexec;
CREATE DATABASE starexec;
GRANT ALL PRIVILEGES ON starexec.* TO  'tomcat'@'localhost' IDENTIFIED BY '--your password here';
FLUSH PRIVILEGES;
exit
"

mysql -u root -p

