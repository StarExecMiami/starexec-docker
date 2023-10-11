STAREXEC DOCKER

Directory "bashS" contains all the bash scripts for the dependencies and building the app

deploy.sh runs at docker build time and is responsible for building the app
start.sh runs at docker run time and is responsible for soft-deploy of app to tomcat

To run, first make sure you have docker installed on your system.

In the CLI, first navigate to the cloned starexec-docker folder.
Start the docker daemon and then type in:

	"podman build -t starexec . "

This will build the image from the Dockerfile.

Make sure that you can use port 80 without sudo/root.
(On linux, add "net.ipv4.ip_unprivileged_port_start=80" to `/etc/sysctl.conf`)

Once done, type in:

	"podman run -it -v volDB:/var/lib/mysql \
			-v volStar:/home/starexec \
			-v volPro:/project \
			-v volSandbox:/home/sandbox \
			-p 80:80 -p 443:443 starexec "

In your browser, visit http://localhost/starexec

Default username: admin
Default password: admin

David's Wiki
https://github.com/davfuenmayor/tptp-utilities/wiki

On Geoff's Mac:
---------------
# Running StarExec in Podman
cd starexec-docker
# If VM not running ...
podman machine start
# One time ... 
podman build -t starexec .
# Every time
podman run -it -v volDB:/var/lib/mysql -v volStar:/home/starexec -v volPro:/project -v volSandbox:/home/sandbox -p 8080:8080 starexec
# -p 80:80 -p 443:443 gives an error that I still have to fix

# Starting and stopping microk8s
microk8s start 
microk8s stop

# About microk8s on Mac ... https://microk8s.io/docs/install-macos
# First tutorial ... https://microk8s.io/docs/getting-started
# More tutorials:  https://ubuntu.com/tutorials?q=microk8s

#----How far I got with Kubernetes
microk8s start
microk8s status --wait-ready

microk8s kubectl get nodes
NAME          STATUS   ROLES    AGE   VERSION
microk8s-vm   Ready    <none>   24h   v1.27.5

microk8s kubectl get services
alias kubectl 'microk8s kubectl'
microk8s kubectl create deployment nginx --image=nginx
# That worked. What is nginx?? It's a web service for load balancing
microk8s kubectl get pods
microk8s enable dns
microk8s enable hostpath-storage
microk8s status

microk8s add-node
#----This needs to be done from the new node, but how do I get onto it?
microk8s join 192.168.64.2:25000/86fd6947d1bc2cc35dbe67394d1269b4/f9266370f430

microk8s dashboard-proxy
# Connected from browser

#----To stop the nginx
kubectl scale deployment nginx --replicas=0


#----Trying to do what David did
# edited servces.yaml
