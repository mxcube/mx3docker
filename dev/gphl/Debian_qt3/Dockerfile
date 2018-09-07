#My first Dockerfile
FROM debian/eol:squeeze
MAINTAINER mguijarr <guijarro@esrf.fr>
RUN apt-get update && apt-get dist-upgrade -y
# RUN apt-get install openssl -y
RUN apt-get install --force-yes python-qt3 -y
RUN apt-get install --force-yes python-dev -y
RUN apt-get install --force-yes git -y
RUN apt-get install --force-yes python-pip -y
RUN apt-get install --force-yes python-qwt5-qt3 -y
RUN apt-get install --force-yes python-sip-dev -y
RUN apt-get install --force-yes python-qt-dev -y
RUN apt-get install --force-yes qt3-dev-tools -y
RUN apt-get install --force-yes libgsl0-dev -y
RUN apt-get install --force-yes python-matplotlib -y
RUN apt-get install --force-yes wget -y
RUN dpkg -l '*openssl*'
RUN dpkg -l '*pip*'
RUN dpkg -l '*wget*'
RUN apt-get install --force-yes make -y
RUN apt-get install --force-yes vim -y
RUN apt-get install --force-yes g++ -y
# RUN which pip
# RUN ls -l /usr/bin/pip
# RUN apt-get update && apt-get dist-upgrade -y

# Add user and group so files on main machine get to belong to user instead of root
RUN groupadd -g 3001 gphl
RUN useradd -g gphl -m -s /bin/tcsh -u 1158 rhfogh
# RUN ls -l /usr/share/pyshared/pip/
RUN apt-get purge -y python-pip
RUN wget --secure-protocol=sslv3 --no-check-certificate https://bootstrap.pypa.io/get-pip.py
RUN python ./get-pip.py
# RUN apt-get install python-pip
# RUN python -m pip install --upgrade pip
# RUN pip install --upgrade pip
# RUN pip install --index-url=https://pypi.org/simple/ --upgrade pip
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




