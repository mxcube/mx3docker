#!/usr/bin/env bash

cd /opt/mxcube3

export NVM_DIR="$HOME/.nvm"
source "$NVM_DIR/nvm.sh"
source "$NVM_DIR/bash_completion"

redis-server &
npm run build
python -m pytest
