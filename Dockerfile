FROM centos:7

ENV LANG=en_US.UTF-8

MAINTAINER Abdullah Zahid <mxz460@miami.edu>

ADD ./dockerPackage ./

RUN allScripts/osScripts/installOsDeps.sh

RUN allScripts/osScripts/SetupUsers.sh

RUN whoami
RUN ls -la allScripts/starexecScripts/

RUN allScripts/starexecScripts/installAllStarexecDeps.sh

RUN allScripts/dockerScripts/DockerAppBuild.sh

EXPOSE 80
EXPOSE 443

CMD allScripts/dockerScripts/DockerRun.sh
