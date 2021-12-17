#!/bin/bash


sudo touch  ~starexec/StarExec-deploy/build/overrides.properties

sudo cat allScripts/starexecScripts/overridesproperties.txt >> ~starexec/StarExec-deploy/build/overrides.properties

echo "Done making overrides.properties file"


