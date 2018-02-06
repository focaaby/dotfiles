#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    echo "macOS OS"
elif [ "$(uname)" == "Linux" ]; then
    ./ubuntu_install.sh 
fi
