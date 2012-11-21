#!/bin/sh 

# install vundle
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install .vimrc
wget -o ~/.vimrc "https://raw.github.com/odd-poet/vimfiles/master/vimrc"

