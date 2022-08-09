#!/usr/bin/env bash

# clone vundle, do  plugin intall qall
# clone oh-my-zsh and curl zshrc (how to say yet to promt?)
# comment out tmux line
#
#

sudo git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
sudo chown gitpod:gitpod ~/.vim/bundle -R

vim +PluginInstall +qall

rm -rf ~/.oh-my-zsh

yes |  sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

sudo apt update && sudo apt install -y tmux cron gettext azure-cli

curl https://raw.githubusercontent.com/nandajavarma/dotfiles/master/.zshrc >> ~/.zshrc

gcloud auth activate-service-account --key-file=/home/gitpod/.config/gcloud/application_default_credentials.json

gsutil cp gs://gitpod-history/.zsh_history ~/.zsh_history

crontab -l > cron_bkp

echo "0 10 * * * sh /home/gitpod/backup-history.sh >/dev/null 2>&1" >> cron_bkp

crontab cron_bkp

rm cron_bkp

sudo chsh -s $(which zsh)

zsh
