#!/bin/bash

#echo "updating sudo rules"

sudo cat allScripts/starexecScripts/sudoRules.txt >> /etc/sudoers
echo "Done"
