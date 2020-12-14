#STAREXEC DOCKER


To run, first make sure you have docker installed on your system.

In the CLI, first navigate to the cloned starexec-docker folder.
Start the docker daemon and then type in:
	"docker build -t starexec . "

This will build the images from the Dockerfile.

Once done, type in:

	"docker run -it -p 7777:8080 starexec "
	

