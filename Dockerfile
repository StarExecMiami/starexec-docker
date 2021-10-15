FROM centos:7

ENV LANG=en_US.UTF-8

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

RUN yum -y update && yum -y upgrade

RUN yum install -y sudo git wget unzip file httpd mod_ssl

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

RUN bash MariaDbconfig.sh

RUN bash setupOverrides.sh

RUN bash UpdateSudoRules.sh

RUN rm -rf /var/lib/mysql/*

RUN usr/libexec/mariadb-prepare-db-dir mariadb.service

ADD ./start.sh ./
ADD ./deploy.sh ./

RUN bash ./deploy.sh
 
EXPOSE 80
EXPOSE 443

CMD bash start.sh
