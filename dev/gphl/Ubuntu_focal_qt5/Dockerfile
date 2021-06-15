FROM ubuntu_focal_qt5

RUN apt-get update

RUN mkdir -p /MXCuBE
WORKDIR /MXCuBE

# Add user and group so files on main machine get to belong to user instead of root
# NB this must be adjusted to the test user. TODO move to separate docker
# RUN groupadd -g 3001 gphl
#RUN useradd -g gphl -m -s /bin/tcsh -u 1158 rhfogh
# No longer makes home directory - this must be mounted externally at startup
# RUN useradd -g gphl -s /bin/tcsh -u 1158 rhfogh

# Directories:
#
# GPhL code locations. Name is should match external directory structure,
# so that the same directory names work inside and outside the docker.
# RUN mkdir -p /archive
# RUN mkdir -p /scratch_fs1
# RUN mkdir -p /public/xtal
RUN mkdir -p /mnt/scratch

# Used instead of Entrypoint to allow alternative commands to be run
CMD ["python3",  "/MXCuBE/mxcube/mxcubeqt/__main__.py", "--pyqt5", "--mockupMode"]
