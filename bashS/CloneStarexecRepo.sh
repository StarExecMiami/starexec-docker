#!/bin/bash


su - starexec -c  "git clone -b AZ --single-branch https://github.com/StarExec/StarExec.git StarExec-deploy"

cd ~starexec/StarExec-deploy/WebContent/css/details && sudo ln -s ../shared

#adds machineSpecs.txt 

touch ~starexec/StarExec-deploy/build/Cluster.MachineSpecs.txt

echo "Done"
