FROM debian:stretch
RUN apt-get update
RUN apt-get install -y git vim
RUN apt-get install -y python-qt4
RUN apt-get install -y python-gevent
RUN apt-get install -y python-louie
RUN apt-get install -y python-jsonpickle
RUN apt-get install -y python-numpy
RUN apt-get install -y python-scipy
RUN apt-get install -y python-matplotlib
RUN apt-get install -y python-suds pymca
RUN apt-get install -y python-yaml
RUN apt-get install -y python-pydispatch

RUN mkdir -p /MXCuBE/mxcube
WORKDIR /MXCuBE/mxcube


# For deploying the application
#RUN git clone git://github.com/mxcube/mxcube /MXCuBE/mxcube
#WORKDIR /MXCuBE/mxcube
#RUN git submodule init
#RUN git submodule update
#WORKDIR /MXCuBE/mxcube/HardwareObjects
#RUN git checkout master
#WORKDIR /MXCuBE/mxcube/HardwareRepository
#RUN git checkout master
#WORKDIR /MXCuBE/mxcube/Blissframework
#RUN git checkout master
#WORKDIR /MXCuBE/mxcube/bin
#ENV USER unknown
#ENV INSTITUTION unknown
#ENV MXCUBE_ROOT /MXCuBE/mxcube

# Run after starting the container
#ENTRYPOINT ["/MXCuBE/mxcube/bin/mxcube2"]
