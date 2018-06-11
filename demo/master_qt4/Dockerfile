FROM mx3_deb9_qt4

WORKDIR /MXCuBE/mxcube
RUN git clone git://github.com/mxcube/mxcube /MXCuBE/mxcube -b master
RUN git submodule init
RUN git submodule update
WORKDIR /MXCuBE/mxcube/bin
ENV USER unknown-user
ENV HARDWARE_REPOSITORY_SERVER /MXCuBE/mxcube/ExampleFiles/HardwareRepository.xml

ENTRYPOINT ["/MXCuBE/mxcube/bin/mxcube"]
