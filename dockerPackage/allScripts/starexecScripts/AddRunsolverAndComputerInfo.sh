#!/bin/bash
set -e
set -o pipefail


mkdir /home/starexec/bin
chown tomcat:star-web /home/starexec/bin

chmod 755 /home/starexec/bin

cp ../../solverAdditions/GetComputerInfo /home/starexec/bin

chown tomcat:star-web /home/starexec/bin/GetComputerInfo

chmod 755 /home/starexec/bin/GetComputerInfo

cp ../../solverAdditions/runsolver /home/starexec/StarExec-deploy/src/org/starexec/config/sge/

