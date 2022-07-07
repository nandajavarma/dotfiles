#!/usr/bin/env bash

# clone vundle, do  plugin intall qall
# clone oh-my-zsh and curl zshrc (how to say yet to promt?)
# comment out tmux line
#
#

sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
vim +PluginInstall +qall

rm -rf ~/.oh-my-zsh


yes |  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"


curl https://raw.githubusercontent.com/nandajavarma/dotfiles/master/.zshrc >> ~/.zshrc
