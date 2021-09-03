#!/bin/bash

#echo "updating sudo rules using visudo command"



sudo cat NewSudoRules.txt >> /etc/sudoers
echo "Done"
