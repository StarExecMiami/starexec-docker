#!/bin/bash

#creates user starexec

echo "creating user starexec"

sudo adduser starexec


sudo su -s /bin/bash - starexec

#clones the repository

git clone -- https://github.com/StarExec/StarExec.git StarExec-deploy

#adds machine 

touch ~starexec/StarExec-deploy/build/Cluster.MachineSpecs.txt

echo "Done"

