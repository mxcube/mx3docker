FROM mx3_deb9_qt4

RUN apt-get update

RUN apt-get install python-pip -y
RUN pip install --upgrade pip

# To get rid of error, that the ps command cannot be found
RUN apt-get install procps -y

# Not used by gphl in dockers, but avoids constant error message
RUN pip install redis

# Python-Java bridge - needed for GPhL workflow:
# Install as root, otehrwise not found in xml parsing
RUN pip install py4j
#RUN pip install py4j --user

# Needed for GPhL simcal
RUN pip install f90nml

# Needed for GPhL stratcal rotation matrices
RUN pip install mgen

# Add user and group so files on main machine get to belong to user instead of root
# NB this must be adjusted to the test user. TODO move to separate docker
RUN groupadd -g 3001 gphl
#RUN useradd -g gphl -m -s /bin/tcsh -u 1158 rhfogh
# No longer makes home directory - this must be mounted externally at startup
RUN useradd -g gphl -s /bin/tcsh -u 1158 rhfogh

# Directories:
#
# /MXCuBE/mxcube - MXCuBE code location is made in mx3_deb9_qt4
#
# GPhL code locations. Name is should match external directory structure,
# so that the same directory names work inside and outside the docker.
RUN mkdir -p /archive
RUN mkdir -p /scratch_fs1
RUN mkdir -p /public/xtal


# Used instead of Entrypoint to allow alternative commands to be run
CMD ["bin/mxcube", "--pyqt4"]
