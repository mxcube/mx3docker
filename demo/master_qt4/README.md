# Docker file for MXCuBE2 demo: Qt4/master

This Docker image is intended to deploy an example mxcube2 application in a docker container based on debian9.

### Before starting

You first need to build the base image `mx3_deb9_qt4` provided in this repository.

### Building the docker image

    docker build -t mx3_deb9_qt4_master_demo /path/to/mx3docker/demo/master_qt4

### Running the demo application
Execute the following commands to start the container:

    xhost +local:

    docker run -d -e HARDWARE_REPOSITORY_SERVER=/MXCuBE/mxcube/ExampleFiles/HardwareObjects.xml -e DISPLAY=$DISPLAY -e QT_X11_NO_MITSHM=1 -v /tmp/.X11-unix:/tmp/.X11-unix mx3_deb9_qt4_master_demo

or run the `start_mxcube2` script provided.