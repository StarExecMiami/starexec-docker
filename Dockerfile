FROM centos:7

ENV LANG=en_US.UTF-8

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

RUN yum -y update && yum -y upgrade
RUN yum install -y sudo git wget unzip file

ADD ./bashS ./

RUN adduser starexec 

RUN adduser tomcat

RUN bash JavaJdk.sh 

RUN bash AntInstall.sh 

RUN bash SassInstall.sh 

RUN bash CloneStarexecRepo.sh

RUN bash configTomcat7.sh

RUN bash MariaDbconfig.sh

RUN bash setupOverrides.sh

RUN bash setupAccounts.sh

RUN bash UpdateSudoRules.sh

ADD ./start.sh ./

RUN rm -rf /var/lib/mysql/*

RUN usr/libexec/mariadb-prepare-db-dir mariadb.service

CMD  bash /start.sh



EXPOSE 8080

