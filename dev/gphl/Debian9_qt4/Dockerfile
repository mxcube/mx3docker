FROM mx3_deb9_qt4

RUN apt-get install python-pip -y
RUN pip install --upgrade pip

# Python-Java bridge - needed for GPhL workflow:
# Install as root, otehrwise not found in xml parsing
RUN pip install py4j
#RUN pip install py4j --user

# Needed for GPhL simcal
RUN pip install f90nml

# Used instead of Entrypoint to allow alternative commands to be run
CMD ["bin/mxcube", "--pyqt4"]
