##############################################################################
# Dockerfile to run MXCuBE web server
##############################################################################

FROM debian:stretch
MAINTAINER Marcus Oscarsson <marcus.oscarsson@esrf.fr>

ARG DOWNLOAD_MXCUBE=1

ENV TERM linux

# Install system pacakges

RUN apt-get update && apt-get -y upgrade && \
    apt-get install -y apt-utils curl git sudo build-essential wget python

WORKDIR /opt

COPY debian-install.sh /opt/debian-install.sh

COPY README.md mxcube3/* /opt/mxcube3/

RUN cd /opt && chmod +x debian-install.sh && ./debian-install.sh $DOWNLOAD_MXCUBE

COPY mxcube /usr/local/bin/
COPY docker-entrypoint.sh /usr/local/bin/
COPY mxcube-test.sh /usr/local/bin/
ENTRYPOINT ["/usr/local/bin/docker-entrypoint.sh"]

EXPOSE 8090 8081