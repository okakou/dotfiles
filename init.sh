#!/bin/sh

cat ${HOME}/dotfiles/_bashrc.add >> ${HOME}/.bashrc
ln -sfn ${HOME}/dotfiles/_bashrc.local ${HOME}/.bashrc.local
ln -sfn ${HOME}/dotfiles/_vimrc ${HOME}/.vimrc
ln -sfn ${HOME}/dotfiles/_wgetrc ${HOME}/.wgetrc
ln -sfn ${HOME}/dotfiles/_gitconfig ${HOME}/.gitconfig
ln -sfn ${HOME}/dotfiles/_screenrc ${HOME}/.screenrc
ln -sfn ${HOME}/dotfiles/_gdbinit ${HOME}/.gdbinit
ln -sfn ${HOME}/dotfiles/_vim ${HOME}/.vim

mkdir -p ${HOME}/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ${HOME}/.vim/bundle/neobundle.vim
