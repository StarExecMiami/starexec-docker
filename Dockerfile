FROM centos:7

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

RUN yum -y update && yum -y upgrade
RUN yum install -y sudo git wget unzip

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

#RUN bash DeployApp.sh

CMD /usr/bin/mysqld_safe --basedir=/usr; bash /DeployApp.sh ; /project/apache-tomcat-7/bin/catalina.sh run  

EXPOSE 8080


