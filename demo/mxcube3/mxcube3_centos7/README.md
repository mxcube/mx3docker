# MXCuBE Docker container

## Introduction

This is a first implementation of a docker container which is able to run
the MXCuBE web application.

It's based on a centOS 7 image and has been built following the procedure
listed in MXCuBE web's wiki:
https://github.com/mxcube/mxcube3/wiki/How-to:-Installation

## Installing Docker

You can find more information about Docker installation here:
https://docs.docker.com/

# How to use it

You can use this container for demonstration purposes, as part of your development
environment or for deployment.

So far, we have been using it for demonstration and development purposes only,
and we will cover them in the following sections.

We will update this how to in the near future with information about how to use
it for deployment.

## Using it for demonstration purposes

This is the easiest way of using this container. The only thing that needs to
be done is to run it ensuring that you have access to the port 8090.

One way of doing this is executing the following command in a terminal:

```
docker run -i -p 8090:8090 -t amilan/mxcube_web
```

## Using it in your development environment

You can use it also as a part of your development environment as a test bench.

One way of doing that is:
1. Get the latest image.
2. Clone the mxcube3 repository in your host.
3. Run the container mounting your host folder.
4. Disable Supervisor in your container.
5. Run the services manually.

### 1- Get the latest image

If you have ran the container before, you already have the image, therefore, you
don't need to do this step.

If not, execute:

```
docker pull amilan/mxcube_web
```

### 2- Clone the mxcube3 repository in your host

In case you don't have it yet, clone the repository:

```
git clone https://github.com/mxcube/mxcube3.git
```

In

### 3- Run the container mounting your host.

```
docker run -i -p 8090:8090 -v /Path/to/your/repo/mxcube3:/mxcube/mxcube3 --name mxcube3 -t amilan/mxcube_web
```

> Note: substitute the path for your own one.

Arrived to this point, if you never installed npm in your mxcube3 repository checkout,
you need to do it, otherwise, skip the following part and go directly to step 4.

You can install npm from inside your container, but be aware that it could take
a lot of time, on the other hand, the advantage of doing it like this is that
you will be sure that you will not have any version conflict.

So, if you still have your docker container running, execute the following command:

```
docker exec -it mxcube3 sh
```

This will give you access to a terminal inside your container. After that,
you can do:

```
npm install
npm install fabric
npm install --dev
```

### 4- Disable Supervisor

There are several possibilities here, maybe the simplest one is to just comment
the processes that we want to run manually.
In order to do that, you should edit the file: /etc/supervisor/supervisord.conf
inside of your container.

```
vi /etc/supervisor/supervisord.conf
```
And get sure that the content of the file looks like this:

```
[supervisord]
nodaemon=true

[program:redis]
command=redis-server

# [program:mxcube]
# command=python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log

# [program:npm]
# command=npm start
```

In case you are not familiar with vi, enter in edit mode pressing 'i'.

Once you are OK with the content of the file, press Esc and type:

```
:wq
```

> Note: keep the two first lines or supervisor will complain.

And then, restart your container:

```
docker restart mxcube3
```

Of course, the best solution is just disable the supervisor service, but
depending on how you do it, you can encounter permission errors, that's why we
said that the simplest one is the above one.

### 5- Run the services manually

If you are already running the container, you can execute the following commands
in different terminals in order to be able to see the output of each service
independently:

```
docker exec -it mxcube3 redis-server
docker exec -it mxcube3 python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log
docker exec -it mxcube3 npm start
```

Where mxcube3 is the name of your container.

After all these steps you should be able to access to your application in a web
browser accessing to localhost:8090

Now you can develop your new features and test it in your browser without any pain.


# Optional: Building the image

If you prefer to make modifications at an image level, you can build a new image
from a dockerfile.

To build it you have to clone this repository:

```
git clone https://github.com/amilan/mxcube_web.git
```

And execute:

```
docker build -t mxcube_web .
```

> Note: mxcube_web is just the name that you will give to your new image,
  feel free to change it if needed.

This will create a new image in your system called mxcube_web. Now you will be
able to run containers using that image.

# Running MXCuBE

Running MXCuBE using this container can be done in several ways, and is up to
you to chose the one that align better with your purpose.

By default, all services will be ran automatically by Supervisor when the
container will be executed without any command. I.e.:

```
docker run -i -p 8090:8090 -t mxcube_web
```

You have also the option of running only a shell in the container and start all
the services manually. In order to do that, you should type:

```
docker run -i -p 8090:8090 -t mxcube_web /bin/bash
```

Then, you are inside of the container and you can start the processes with this
command:

```
run_mxcube
```

And finally, you can also run the container without running supervisor and then
execute the processes in independent terminals, as explained above.

```
docker restart -it mxcube3
```

```
docker exec -it mxcube3 redis-server
docker exec -it mxcube3 python mxcube3-server -r test/HardwareObjectsMockup.xml --log-file mxcube.log
docker exec -it mxcube3 npm start
```

Last step: have fun using mxcube web!
