#!/bin/sh

ln -s .dot/bashrc .bashrc
ln -s .dot/vim .vim
ln -s .dot/vimrc .vimrc
ln -s .dot/gitconfig .gitconfig
cd .ssh 
ln -s ../.dot/sshconfig config
cd ..

