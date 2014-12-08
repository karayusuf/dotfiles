#!/bin/bash
set -e

# Full path to local repository
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
VUNDLE_DIR="${DIR}/vim/vundle"

rm -rf ${VUNDLE_DIR}
rm -rf ~/.profile
rm -rf ~/.gitconfig
rm -rf ~/.irbrc
rm -rf ~/.pryrc
rm -rf ~/.vimrc
rm -rf ~/.vim

git clone https://github.com/gmarik/vundle.git ${VUNDLE_DIR}

ln -s "${DIR}/profile" ~/.profile
ln -s "${DIR}/gitconfig" ~/.gitconfig
ln -s "${DIR}/irbrc" ~/.irbrc
ln -s "${DIR}/irbrc" ~/.pryrc
ln -s "${DIR}/vim/vimrc" ~/.vimrc
ln -s "${DIR}/vim" ~/.vim

mkdir ~/.swp

vim -c "BundleInstall"
