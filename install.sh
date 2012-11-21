#!/bin/sh 

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install .vimrc
curl -o ~/.vimrc "https://raw.github.com/odd-poet/vimfiles/master/vimrc"

