#!/bin/bash


su - starexec -c  "git clone -- https://github.com/StarExec/StarExec.git StarExec-deploy"

cd ~starexec/StarExec-deploy/WebContent/css/details && sudo ln -s ../shared

#adds machineSpecs.txt 

touch ~starexec/StarExec-deploy/build/Cluster.MachineSpecs.txt

sed -i.bak s/b109f3bbbc244eb82441917ed06d618b9008dd09b3befd1b5e07394c706a8bb980b1d7785e5976ec049b46df5f1326af5a2ea6d103fd07c95385ffab0cacbc86/c7ad44cbad762a5da0a452f9e854fdc1e0e7a52a38015f23f3eab1d80b931dd472634dfac71cd34ebc35d16ab7fb8a90c81f975113d6c7538dc69dd8de9077ec/g ~starexec/StarExec-deploy/sql/new-install/MinimalData.sql

sed -i.bak s/admin@uiowa.edu/admin/g ~starexec/StarExec-deploy/sql/new-install/MinimalData.sql

sed -i.bak s/Starexec4ever/admin/g ~starexec/StarExec-deploy/sql/new-install/MinimalData.sql



echo "Done"

