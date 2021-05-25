FROM ubuntu:focal

ENV TERM linux
ENV TZ Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
# Install system packages - from Marcus O mxcub3

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y apt-utils curl git sudo wget python
RUN apt-get install -y build-essential

RUN mkdir -p /MXCuBE/mxcube
WORKDIR /MXCuBE/mxcube

# Qt5 install - from install_pyqt5.sh
# RUN add-apt-repository --yes ppa:ubuntu-sdk-team/ppa
# RUN apt-get update -qq

# Install Qt5, QtMultimedia and QtSvg
RUN apt-get install -qq qtdeclarative5-dev
ENV  QMAKE /usr/lib/x86_64-linux-gnu/qt5/bin/qmake

# Library versions
# PYTHON_VERSION=3
# PYQT_VERSION=5.7.1
# SIP_VERSION=4.19

# Install sip
RUN wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/sip/sip-4.19/sip-4.19.tar.gz
RUN tar -xzf sip-4.19.tar.gz
RUN pwd
RUN ls -l
WORKDIR /MXCuBE/mxcube/sip-4.19
RUN pwd
RUN ls -l
RUN  cat configure.py
RUN python3 configure.py
RUN make
RUN sudo make install
WORKDIR /MXCuBE/mxcube

# Install PyQt5
RUN wget --retry-connrefused https://sourceforge.net/projects/pyqt/files/PyQt5/PyQt-5.7.1/PyQt5_gpl-5.7.1.tar.gz
RUN tar -xzf PyQt5_gpl-5.7.1.tar.gz
WORKDIR /MXCuBE/mxcube/PyQt5_gpl-5.7.1
RUN python3 configure.py --confirm-license --qmake=/usr/lib/x86_64-linux-gnu/qt5/bin/qmake
RUN make
RUN make install
WORKDIR /MXCuBE/mxcube

