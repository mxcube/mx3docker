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
RUN pip install --upgrade pip
RUN pip install jsonpickle --user
RUN pip install gevent==1.1 --user
RUN pip install louie --user
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
WORKDIR /root
RUN git clone git://github.com/mxcube/mxcube -b 2.2
WORKDIR "mxcube"
RUN git submodule init
RUN git submodule update
WORKDIR /root/mxcube
# Unnecessary once the relevant bug is fixed:
RUN rm BlissFramework/Bricks/InstanceListBrick.py
RUN mv ./example_mxcube.gui mxcube.gui
ENV USER unknown_user




