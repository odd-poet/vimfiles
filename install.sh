#!/bin/sh 

# install vundle
echo "Installing vundle (see https://github.com/gmarik/vundle)"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle

# install .vimrc
echo "Download default .vimrc "
curl -o ~/.vimrc "https://raw.github.com/odd-poet/vimfiles/master/vimrc"

echo "Done!"
