#!/bin/bash

sudo mkdir /scratch/projects/exempt/starexec/data_dir

sudo chown tomcat:star-web /scratch/projec
ts/exempt/starexec/data_dir

sudo ln -s /scratch/projects/exempt/startexec /starexec

sudo ln -s /scratch/projects/exempt/starte
xec/data_dir /home/starexec

sudo echo "/export10.10.1.0/24(rw,no_root_squash,sync,no_subtree_check)" >> /etc/exp
orts

exportfs -ra

echo "done"

