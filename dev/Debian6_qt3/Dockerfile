#My first Dockerfile
FROM debian/eol:squeeze
MAINTAINER mguijarr <guijarro@esrf.fr>
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install python-qt3 -y
RUN apt-get install python-dev -y 
RUN apt-get install git -y
RUN apt-get install python-pip -y
RUN apt-get install python-qwt5-qt3 -y
RUN apt-get install python-sip-dev -y
RUN apt-get install python-qt-dev -y
RUN apt-get install qt3-dev-tools -y
RUN apt-get install libgsl0-dev -y
RUN apt-get install python-matplotlib -y
RUN apt-get install wget -y
RUN apt-get install make -y
RUN apt-get install vim -y
RUN apt-get install g++ -y

# Add user and group so files on main machinne get to belong to u er instead of root
RUN groupadd -g 3001 gphl
RUN useradd -g gphl -m -s /bin/tcsh -u 1158 rhfogh
RUN pip install --index-url=https://pypi.python.org/simple/ --upgrade pip
RUN pip install  jsonpickle
RUN pip install  gevent==1.1
RUN pip install  louie
WORKDIR /tmp
RUN wget https://github.com/vasole/pymca/archive/v4.7.4.tar.gz && tar xzvf v4.7.4.tar.gz && cd pymca-4.7.4 && python setup.py install
WORKDIR /tmp
RUN git clone git://github.com/mxcube/pychooch
WORKDIR "pychooch"
RUN python setup.py install
WORKDIR /tmp
RUN git clone git://github.com/mxcube/qub
WORKDIR "qub"
RUN sed --in-place -e 's/opencv_module]/]/' setup.py
RUN python setup.py install

# Python-Java bridge - needed for GPhL workflow:
RUN pip install py4j

# Needed for python version < 3.4
RUN pip install enum34

# Needed as this docker is Python 2.6
RUN pip install ordereddict

# Needed for simcal
RUN pip install f90nml

RUN mkdir -p /MXCuBE
WORKDIR /MXCuBE/mxcube

# Copy the file before running, instead:
#RUN mv ./example_mxcube.gui mxcube.gui

ENV USER rhfogh
# Or specify user when you run the docker
CMD ["bin/mxcube", "--hardwareRepository=HardwareRepository/tests/xml"]




