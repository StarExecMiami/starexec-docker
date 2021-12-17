#!/bin/bash

usr/sbin/httpd

#add config files for ssh

cp ./configFiles/ssl.conf /etc/httpd/conf.d/

#add starexec configFile for https

cp ./configFiles/starexec.conf /etc/httpd/conf.d/
