# mx3docker
Docker file + startup script for MXCuBE 2

## Building the docker image (from ESRF)

    docker build -t mxcube2  --build-arg http_proxy=http://proxy.esrf.fr:3128 --build-arg https_proxy=http://proxy.esrf.fr:3128 .

## Starting

As the Docker image needs X11 forwarding it is a bit more complicated than usual, so there is a `./start_mxcube2` script
that makes the right docker command line to start the image.

## Starting MXCuBE 2

Once image is running:

    ./bin/mxcube --hardwareRepository=./ExampleFiles/HardwareObjects.xml
    
    
