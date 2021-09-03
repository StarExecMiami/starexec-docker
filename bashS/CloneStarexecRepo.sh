#!/bin/bash


su - starexec  -c  "git clone -b AZ --single-branch https://github.com/jackeown/StarExec.git StarExec-deploy"

chown -R tomcat:star-web /home/starexec

cd ~starexec/StarExec-deploy/WebContent/css/details && sudo ln -s ../shared

#adds machineSpecs.txt 

touch ~starexec/StarExec-deploy/build/Cluster.MachineSpecs.txt

echo "Done"
