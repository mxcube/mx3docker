# mx3docker
Docker file + startup script for the GLobal Phasing version
of the MXCuBE 2 + qt4 development version

The docker mounts your local copy of the MXCuBE repository through a shared mounted directory.

## Building the docker image

    docker build -t mx3_deb9_qt4_gphl /path/to/mx3docker/dev/gphl/Debian9_qt4

## Before starting:

Set environment variable, e.g. (in ~/.bashrc for bash):

    export MXCUBE2_ROOT=/path/to/dir/containing/mxcube/repository

Edit the start_mxcube2 file to set MXCuBE HO and HardwareRepository paths,
User ID to use (for file permissions), output data directory,
and directories and license info for Global Phasing software.

Check that you have the right configuration directories, and that the GPhL
HOs are enabled in the configuration.

## Running the container
Execute the `start_mxcube2` script to run the right docker command line with required options:

    ./start_mxcube2


