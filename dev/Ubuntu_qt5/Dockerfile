FROM ubuntu:focal

# Set terminal and time zone, to catch installer interactoin attempts
ENV TERM linux
ENV TZ Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install system packages - from Marcus O mxcub3
RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y apt-utils curl git sudo wget python
RUN apt-get install -y build-essential

# Install 'top-level' packages
RUN apt-get install -y python3-scipy
RUN apt-get install -y python3-pyqtgraph

# NB numpy, matplotlib, Pillow, PyQt5, and sip
# are installed at this point

# Get and update pip
RUN apt-get install python3-pip -y
RUN pip install --upgrade pip

# From requirement list
#RUN pip install greenlet==0.4.16
#RUN pip install gevent==1.3.7
RUN pip install gevent
RUN pip install suds-py3
RUN pip install jsonpickle
RUN pip install ruamel.yaml
RUN pip install PyDispatcher
RUN pip install pylint
RUN pip install lxml
RUN pip install jsonschema

# Global Phasing requirements
# Python-Java bridge - needed for GPhL workflow:
# Install as root, otherwise not found in xml parsing
#RUN pip install py4j==0.10.6
RUN pip install py4j
# Needed for GPhL simcal and stratcal
RUN pip install f90nml
# Needed for GPhL stratcal rotation matrices
RUN pip install mgen
