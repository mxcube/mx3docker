# mx3docker
Docker file + startup script for MXCuBE 2 + qt4 development version

The docker mounts your local copy of the MXCuBE repository through a shared mounted directory.

## Building the docker image

    docker build -t mx3_deb9_qt4 /path/to/mx3docker/dev/Debian9_qt4

## Before starting:

Set environment variable, e.g. (in ~/.bashrc for bash):

    export MXCUBE2_ROOT=/path/to/dir/containing/mxcube/repository


## Running the container
Execute the `start_mxcube2` script to run the right docker command line with required options:

    ./start_mxcube2

This will prompt you to the the working directory inside the clean docker container.

