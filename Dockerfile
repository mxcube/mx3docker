#My first Dockerfile
FROM ubuntu:12.04
MAINTAINER mguijarr <guijarro@esrf.fr>
RUN apt-get update && apt-get dist-upgrade -y
RUN apt-get install python-qt3 -y
RUN apt-get install python-dev -y 
RUN apt-get install pymca -y
RUN apt-get install python-guiqwt -y
RUN apt-get install git -y
RUN apt-get install python-pip -y
RUN apt-get install python-opencv -y
RUN pip install jsonpickle --user
RUN pip install gevent --user
RUN pip install louie --user
WORKDIR /tmp
RUN git clone git://github.com/mxcube/pychooch
WORKDIR "pychooch"
RUN apt-get install libgsl0-dev -y
RUN python setup.py install
WORKDIR /tmp
RUN git clone git://github.com/mxcube/qub
RUN apt-get install python-sip-dev -y
RUN apt-get install python-qt-dev -y
RUN apt-get install qt3-dev-tools -y
WORKDIR "qub"
RUN sed --in-place -e 's/opencv_module]/]/' setup.py
RUN python setup.py install
WORKDIR /root
RUN git clone git://github.com/mxcube/mxcube -b 2.2
WORKDIR "mxcube"
RUN git submodule init
RUN git submodule update
RUN apt-get install python-qwt -y
RUN rm BlissFramework/Bricks/InstanceListBrick.py
RUN mv ./example_mxcube.gui mxcube.gui
ENV USER unknown_user




