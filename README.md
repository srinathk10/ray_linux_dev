# ray_linux_dev

Ray containerized developer environment for Linux


## Install Docker for Linux

Install your favourite dev tools for Linux and Docker before proceeding.


## Clone Ray

Follow the instructions [here](https://docs.ray.io/en/latest/ray-contribute/development.html#id1) and clone the ray project.

```sh
[ec2-user@ip-xxx ray_linux_dev]$ pwd
/home/ec2-user/anyscale/ray_linux_dev
[ec2-user@ip-xxx ray_linux_dev]$ ls
Dockerfile  README.md  devSetup.sh  env
[ec2-user@ip-xxx ray_linux_dev]$ git clone https://github.com/ray-project/ray.git
Cloning into 'ray'...
remote: Enumerating objects: 375179, done.
remote: Counting objects: 100% (74/74), done.
remote: Compressing objects: 100% (56/56), done.
remote: Total 375179 (delta 19), reused 52 (delta 11), pack-reused 375105 (from 1)
Receiving objects: 100% (375179/375179), 427.50 MiB | 54.88 MiB/s, done.
Resolving deltas: 100% (287977/287977), done.
Updating files: 100% (8273/8273), done.
```


## Build the Ray dev container

Build the container image running below commands.

```sh
[ec2-user@ip-xxx ray_linux_dev]$ pwd
/home/ec2-user/anyscale/ray_linux_dev

[ec2-user@ip-xxx ray_linux_dev]$ ./devSetup.sh --build
```

It should create 'ray-build' container.
```sh
[ec2-user@ip-xxx ray_linux_dev]$ docker images | grep ray-build
ray-build     latest    8e5df55be99d   11 minutes ago   4.16GB
```


## Run the Ray dev container

To run the dev container, run the below command.

```sh
[ec2-user@ip-xxx ray_linux_dev]$ ./devSetup.sh --run
Running new Docker container mounting /home/ec2-user/Anyscale...
2cd1a07a2ac2470980d38df9f868c8a842e941433826faf8be124abb646755fc
Entering the container...
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.

[ec2-user@ip-xxx ray_linux_dev]$ docker ps
CONTAINER ID   IMAGE       COMMAND       CREATED          STATUS          PORTS     NAMES
2cd1a07a2ac2   ray-build   "/bin/bash"   27 seconds ago   Up 27 seconds             ray-build
```


## Enter the Ray dev container

To enter the dev container, run './devSetup.sh --run' or './devSetup.sh --exec bash'.


```sh
[ec2-user@ip-xxx ray_linux_dev]$ ./devSetup.sh --run
Container 'ray-build' is already running.
Entering the container...
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```

```sh
[ec2-user@ip-xxx ray_linux_dev]$ ./devSetup.sh --exec bash
Executing command inside 'ray-build' container...
To run a command as administrator (user "root"), use "sudo <command>".
See "man sudo_root" for details.
```


## Build Ray

Follow the instructions [here](https://docs.ray.io/en/latest/ray-contribute/development.html#building-ray-on-linux-macos-full) and build the project. Note that the build commands need to be run inside the container.


## Updating Conda Packages

Update packages in `env/environment.yml` file and run below command to pull in the new packages in your env.

```sh
conda env update --file env/environment.yml
```
