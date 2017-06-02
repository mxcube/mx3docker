# mx3docker
Docker file + startup script for MXCuBE 2 Development versions

The docker calls the MXCuBE code on your host system, through a shared mounted directory

## Building the docker image

    docker build -t mxcube2_dev /path/to/mx3docker/dev/Debian6_qt3

## Before starting:

# Set environment variable, e.g. (in ~/.cshrc for tcsh):

setenv MXCUBE2_ROOT /path/to/dir/containing/example_mxcube.gui

# copy example_mxcube.gui to mxcube.gui

cp example_mxcube.gui mxcube.gui

## Starting

As the Docker image needs X11 forwarding and host network access it is a bit
more complicated than usual.

Use the start_mxcube2 script ('bash start_mxcube2') to run
the right docker command line to start the image. The image is set up so that
mxcube will start automatically. If you want to vary the arguments passed to
mxcube2, modify the last line in the Dockerfile, and rebuild
    
    
