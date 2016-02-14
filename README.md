# Architecture

This project uses *Vagrant*, *Docker* and *Chef* together to achieve the goal
defined in the specs.

Vagrant will launch a virtualbox VM, inside the VM through Vagrant shell provisioning docker-compose will launch 3 containers:
- 1 web (nginx) 
- 2 apps (go)

then Chef will run inside each container.

This demo requires Vagrant installed on the local machine, in case Vagrant is not available, the demo may work if chef and docker are installed and available locally but I haven't tested this directly, I would recommend the Vagrant option.

The docker container images used are a bit old so the apt-gets are taking a little longer
to update the packages in the containers. 

I preferred this approach rather than using newly created images because using a third party docker image without my direct control is a better proof of genuine devops automation. 

This, eventually, can be easily rectified tagging and pushing the containers on DockerHub or on a Docker private registry.

To install ChefDK inside the Vagrant box please uncomment it in the shell provisioning section at the end of the Vagrantfile.

# Run the demo

To launch the demo please run:

```
~$ git clone https://github.com/fabiop/14feb2016.git && cd 14feb2016 && vagrant up
```

For the sake of this demo, docker-compose will run in foreground mode so all the logs will
be visible in the main terminal without the need of logging in the Vagrant box.

When the docker-compose log stream will stop, after the 3rd chef run completes,
the system will be up and ready to be tested.


# Testing

Vagrant is configured with a *bridged network* , I preferred bridged over the port forwarding approach to avoid eventual port conflicts, so the Vagrant VM will get a dhcp entry from the local network.

To get the ip of the VM without the need to ssh into it please run this command:

```
vagrant ssh -c "ip a"|grep inet|grep eth
```

Then, once the VM IP has been determined, please test with the following command:

```
for i in `seq 1 10`; do curl http://<YOUR_VM_IP_HERE> ; echo ; done
```

# Linting 

The code has been linted and should pass foodcritic and rubocop tests 

