#!/bin/bash


su - starexec -c  "git clone -- https://github.com/StarExec/StarExec.git StarExec-deploy"

#adds machine 

touch ~starexec/StarExec-deploy/build/Cluster.MachineSpecs.txt

echo "Done"

