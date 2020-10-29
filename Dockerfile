FROM centos:7

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

RUN yum install -y sudo git wget unzip

ADD ./bashS ./

RUN adduser starexec 

RUN adduser tomcat

RUN bash JavaJdk.sh AntInstall.sh SassInstall.sh CloneStarexecRepo.sh

