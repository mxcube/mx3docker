# MXCuBE3 Docker Container

Docker container for MXCuBE3 based on Debian 9 with a desktop environment (Mate)
and a VNC server.

## Building

The docker file can be built simply by issuing:

```
docker build -t mxcube3-desktop .
```

The name of the image will be mxcube3-desktop

## Running

After beeing built the docker file can be executed with:

```
docker run -p 5901:5901 -dt mxcube3-desktop
```

This execues the docker container in deatached mode, the status can be viewed with

```
docker ps
```

## Connecting to the VNC server
This docker container comes with a pre-configured desktop enviroment that can be accessed
by using VNC. Simply connect to <ip-address>:1 and give the password "mxcube"

To get the container id run
```
docker ps
```

To get the container ip address issue:
```
docker inspect <container id>
```

Connect with a VNC client (for istance vncviewer) PASSWORD IS: mxcube
```
vncviewer <ip-address>:1
```









