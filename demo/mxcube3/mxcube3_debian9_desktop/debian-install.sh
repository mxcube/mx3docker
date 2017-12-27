#!/usr/bin/env bash

{ # this ensures the entire script is downloaded #

system_has() {
  type "$1" > /dev/null 2>&1
}

mxcube_source() {
  echo "https://github.com/mxcube/mxcube3.git"
}

mxcube_install_dir() {
  echo "mxcube3"
}

mxcube_download() {
  if ! system_has git; then
    echo >&2 'You need git, curl, or wget to install MXCuBE'
    exit 1
  fi
    
  command git clone "$(mxcube_source)" "$(mxcube_install_dir)" || {
    echo >&2 'Failed to clone mxcube-3 repo. Please report this !'
    exit 2
  }

  command cd "$(mxcube_install_dir)"
  command git submodule init
  command git submodule update
}

install_debian_deps() {
  # Scipy, LAPACK BLAS
  command sudo apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

  # python-ldap
  command sudo apt-get -y install libsasl2-dev python-pip python python-dev libldap2-dev libssl-dev

  # redis
  command sudo apt-get -y install redis-server

  # v4l2-loopback
  command sudo apt-get -y install v4l2loopback-dkms v4l2loopback-utils

  #ffmpeg
  command sudo apt-get -y install ffmpeg

  #pillow
  command sudo apt-get -y install libxml2-dev libxslt-dev libtiff-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk
}

install_python_deps() {
  command pip2 install numpy
  command pip2 install -r requirements.txt
}

install_node() {
  # nvm
  command curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh"
  source "$NVM_DIR/bash_completion"
  nvm install --lts
  npm install
}

mxcube_download
install_debian_deps
install_python_deps
install_node

} # this ensures the entire script is downloaded #
