#!/bin/sh

if [ ! -d "$HOME/.yadr" ]; then
    echo "Installing YADR for the first time"
    git clone https://bitbucket.org/zach-taylor/dotfiles.git "$HOME/.yadr"
    cd "$HOME/.yadr"
    [ "$1" = "ask" ] && export ASK="true"
    rake install
else
    echo "YADR is already installed"
fi
