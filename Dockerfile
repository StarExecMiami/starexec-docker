FROM centos:7

ENV LANG=en_US.UTF-8

# Copy 
ADD --chmod=0777 ./dockerPackage/configFiles ./configFiles
ADD --chmod=0755 ./dockerPackage/solverAdditions ./solverAdditions


# Run OS scripts
ADD --chmod=0755 ./dockerPackage/allScripts/osScripts ./allScripts/osScripts

RUN allScripts/osScripts/installOsDeps.sh

RUN allScripts/osScripts/SetupUsers.sh

RUN whoami

# Run Starexec scripts
ADD --chmod=0755 ./dockerPackage/allScripts/starexecScripts ./allScripts/starexecScripts
RUN ls -la allScripts/starexecScripts/

RUN allScripts/starexecScripts/installAllStarexecDeps.sh


# Run container build scripts
ADD --chmod=0755 ./dockerPackage/allScripts/dockerScripts ./allScripts/dockerScripts
RUN allScripts/dockerScripts/DockerAppBuild.sh

EXPOSE 80
EXPOSE 443

CMD allScripts/dockerScripts/DockerRun.sh
