# MXCuBE3 Docker Container

Docker container for MXCuBE3 based on a minimal Debian 9 installation. This image
should only be used for demonstration and testing purposes. 

For a container bundeled with a desktop enviroment and browser use mxcube3_debian9_desktop

## Building

The docker file can be built by simply issuing:

```
docker build -t mxcube3-backend .
```

The name of the image will be mxcube3-backend

## Running

After beeing built the docker file can be executed with:

```
docker run -p 8090:8090 -dt mxcube3-backend
```

This execues the docker container in deatached mode, the status can be viewed with

```
docker ps
```

## Connecting to the application
Open a browser and point it to localhost:8090

The test credentials are:
username: idtest0
password: 000









