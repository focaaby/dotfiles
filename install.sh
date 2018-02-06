#!/bin/bash

if [ "$(uname)" == "Darwin" ]; then
    echo "macOS OS"
elif [ "$(uname)" == "Linux" ]; then
    ./ubuntu_install.sh 
fi

# links all dotfiles
ln -s ~/.dotfiles/.zshrc ~/
ln -s ~/.dotfiles/.tmux.conf ~/
ln -s ~/.dotfiles/.gitconfig ~/ && ln -s ~/.dotfiles/.gitignore_global ~/
