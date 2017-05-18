# mx3docker
Docker file + startup script for MXCuBE 2

## Building the docker image (from ESRF)

docker build -t mxcube2  --build-arg http_proxy=http://proxy.esrf.fr:3128 --build-arg https_proxy=http://proxy.esrf.fr:3128 .
