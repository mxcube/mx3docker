#!/usr/bin/env bash
{ # this ensures the entire script is downloaded #
DOWNLOAD_MXCUBE=${1:-1}
echo "DOWNLOAD_MXCUBE:" $DOWNLOAD_MXCUBE

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

  command rm -rf "$(mxcube_install_dir)"
  command git clone "$(mxcube_source)" "$(mxcube_install_dir)" || {
    echo >&2 'Failed to clone mxcube-3 repo. Please report this !'
    exit 2
  }

  command cd "$(mxcube_install_dir)"
  command git submodule init
  command git submodule update
}

install_debian_deps() {

  command apt-get update

  # Scipy, LAPACK BLAS
  command apt-get -y install libblas-dev liblapack-dev libatlas-base-dev gfortran

  # python-ldap
  command apt-get -y install libsasl2-dev python-pip python python-dev libldap2-dev libssl-dev

  # redis
  command apt-get -y install redis-server

  # v4l2-loopback
  command apt-get -y install v4l2loopback-dkms v4l2loopback-utils

  #ffmpeg
  command apt-get -y install ffmpeg

  #pillow
  command apt-get -y install libxml2-dev libxslt-dev libtiff-dev libjpeg-dev zlib1g-dev libfreetype6-dev liblcms2-dev libwebp-dev tcl8.5-dev tk8.5-dev python-tk

  # npm package imagemin
  command apt-get -y install nodejs nodejs-legacy build-essential nasm libpng12-dev libpng-dev libpng++-dev libpng-tools libpng16-16 zlibc pkg-config
  command apt-get -y install libcairo2-dev libjpeg-dev libpango1.0-dev libgif-dev build-essential librsvg2-dev

}

install_python_deps() {
  command pip2 install numpy
  command pip2 install pytest
  command pip2 install -r requirements.txt
}

install_node() {
  # nvm
  command curl -o- https://raw.githubusercontent.com/creationix/nvm/v0.33.2/install.sh | bash
  export NVM_DIR="$HOME/.nvm"
  source "$NVM_DIR/nvm.sh"
  source "$NVM_DIR/bash_completion"
  nvm install --lts

  command npm install imagemin-pngquant@5.0.1 --save
  command npm install
}

install_pngquant() {
  command cd /opt/mxcube3
}

if [ $DOWNLOAD_MXCUBE == 1 ] ; then
    mxcube_download
fi

install_debian_deps
install_python_deps
install_pngquant
install_node

} # this ensures the entire script is downloaded #
