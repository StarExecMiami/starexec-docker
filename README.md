STAREXEC DOCKER

Directory "bashS" contains all the bash scripts for the dependencies and building the app

deploy.sh runs at docker build time and is responsible for building the app
start.sh runs at docker run time and is responsible for soft-deploy of app to tomcat

To run, first make sure you have docker installed on your system.

In the CLI, first navigate to the cloned starexec-docker folder.
Start the docker daemon and then type in:

	"podman build -t starexec . "

This will build the image from the Dockerfile.

Once done, type in:

	"podman run -it -v volDB:/var/lib/mysql \
			-v volStar:/home/starexec \
			-v volPro:/project \
			-v volSandbox:/home/sandbox \
			-p 8080:8080 starexec "

In browser localhost:8080:8080
admin admin
