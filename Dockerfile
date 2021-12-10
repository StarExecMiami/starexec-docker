FROM centos:7

ENV LANG=en_US.UTF-8

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

RUN yum -y update && yum -y upgrade

RUN yum install -y sudo git wget unzip file httpd mod_ssl scl-utils

ADD ./devToolsInstall.sh ./

RUN bash devToolsInstall.sh

ADD ./dependencies ./

RUN bash JavaJdk.sh 

RUN bash AntInstall.sh 

RUN bash SassInstall.sh

RUN wget --no-check-certificate https://www.openssl.org/source/openssl-1.0.2g.tar.gz -O - | tar -xz

RUN cd ./openssl-1.0.2g && ./config --prefix=/usr/local/openssl --openssldir=/usr/local/openssl && pwd && ls -la /bin/make && /bin/make install && cd ../ 

RUN useradd starexec

ADD ./createSSLforLocalHost.sh ./

RUN bash createSSLforLocalHost.sh

ADD ./configFiles/starexec.conf /etc/httpd/sites-enabled/

ADD ./configFiles/ssl.conf /etc/httpd/conf.d/

ADD ./bashS ./

ADD ./setupUsers.sh ./

RUN /usr/sbin/httpd

RUN bash setupUsers.sh

RUN bash CloneStarexecRepo.sh

RUN bash configTomcat7.sh

#RUN sudo ls -al /var/lib/mysql

RUN bash MariaDbconfig.sh

RUN sudo ls -al /var/lib/mysql

RUN sudo rm -rf /var/lib/mysql/*

RUN usr/libexec/mariadb-prepare-db-dir mariadb.service

RUN bash setupOverrides.sh

RUN bash UpdateSudoRules.sh

RUN ps -aux

#RUN sudo mkdir /var/lib/mysql
#RUN sudo chown mysql /var/lib/mysql
#RUN sudo chmod 755 /var/lib/mysql

RUN sudo ls -la /var/lib/mysql/

RUN yum install -y tcsh

ADD ./GetComputerInfo ./

RUN mkdir /home/starexec/bin

RUN chown tomcat:star-web /home/starexec/bin

RUN chmod 755 /home/starexec/bin

RUN cp ./GetComputerInfo /home/starexec/bin

RUN chown tomcat:star-web /home/starexec/bin/GetComputerInfo

RUN chmod 755 /home/starexec/bin/GetComputerInfo


ADD ./runsolver ./

#RUN cp ./runsolver /home/starexec/Solvers
RUN cp ./runsolver /home/starexec/StarExec-deploy/src/org/starexec/config/sge/
#RUN cp ./runsolver /home/starexec/StarExec-deploy/bin/classes/org/starexec/config/sge/ 


ADD ./start.sh ./
ADD ./deploy.sh ./

RUN bash ./deploy.sh
 
EXPOSE 80
EXPOSE 443

CMD bash start.sh
