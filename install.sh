#!/bin/sh 

# install vundle
echo "Installing vundle (see https://github.com/gmarik/vundle)"
echo "--------------------------------------------------------"
git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
echo 

# install .vimrc
echo "Download default .vimrc "
echo "--------------------------------------------------------"
curl -o ~/.vimrc "https://raw.github.com/odd-poet/vimfiles/master/vimrc"

echo "Done!"
