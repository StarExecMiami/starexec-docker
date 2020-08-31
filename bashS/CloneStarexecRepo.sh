#!/bin/bash

#creates user starexec

echo "creating user starexec"

sudo adduser starexec

#clones the repository

git clone -- https://github.com/StarExec/StarExec.git StarExec-deploy

echo "Done"

