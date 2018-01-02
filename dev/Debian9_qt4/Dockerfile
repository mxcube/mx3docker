FROM debian:stretch
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install -y git vim apt-utils python-jsonpickle python-yaml
RUN apt-get install -y mesa-common-dev libgl1-mesa-dev libglu1-mesa-dev python-qt4 python-dev python-qt4-dev
RUN apt-get install -y python-gevent python-louie python-pydispatch
RUN apt-get install -y python-numpy python-scipy python-matplotlib

# Tools for PYMCA etc. installation
RUN apt-get install -y wget make g++

# Add user and group so files on main machinne get to belong to u er instead of root
RUN groupadd -g 3001 gphl
RUN useradd -g gphl -m -s /bin/tcsh -u 1158 rhfogh

# Python-Java bridge - needed for GPhL workflow:
RUN apt-get install python-pip -y
RUN pip install --upgrade pip

# Add to get PyMCa
WORKDIR /tmp
RUN wget https://github.com/vasole/pymca/archive/v4.7.4.tar.gz && tar xzvf v4.7.4.tar.gz && cd pymca-4.7.4 && python setup.py install
#WORKDIR /tmp
#RUN git clone git://github.com/mxcube/pychooch
#WORKDIR "pychooch"
#RUN python setup.py install

# Python-Java bridge - needed for GPhL workflow:
# Try inhstalling as root, as otherwise not found in XML parsing
RUN pip install py4j
#RUN pip install py4j --user

## Needed for python version < 3.4
#RUN pip install enum34

# Needed for GPhL simcal
RUN pip install f90nml

# the subdirectory is mounted from the outside in the dev version,
# but must be created in the demo version
#RUN mkdir -p /MXCuBE/mxcube
RUN mkdir -p /MXCuBE
WORKDIR /MXCuBE/mxcube



# Used instead of Entrypoint to allow alterntive commands to be run
ENV USER rhfogh
CMD ["bin/mxcube", "--hardwareRepository=HardwareRepository/tests/xml", "-QT4"]
