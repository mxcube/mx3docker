FROM mx3_deb9_qt4

# For deploying the application
# We should better tag a version
RUN git clone git://github.com/mxcube/mxcube /MXCuBE/mxcube
WORKDIR /MXCuBE/mxcube
RUN git submodule init
RUN git submodule update
WORKDIR /MXCuBE/mxcube/HardwareObjects
RUN git checkout master
WORKDIR /MXCuBE/mxcube/HardwareRepository
RUN git checkout master
WORKDIR /MXCuBE/mxcube/Blissframework
RUN git checkout master
WORKDIR /MXCuBE/mxcube/bin
ENV USER unknown
ENV INSTITUTION unknown
ENV MXCUBE_ROOT /MXCuBE/mxcube

ENTRYPOINT ["/MXCuBE/mxcube/bin/mxcube2"]
