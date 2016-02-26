# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="My-oh-my"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias c="clear"
alias dev="ssh app@dev.engagementhq.com"
alias wrk="cd ~/work/glusterfs"
alias dance="cd ~/work/dance_school && /bin/zsh --login"
alias be="bundle exec"
alias b="bundle"
alias cfd="cap feature deploy"
alias vwrk="cd ~/work; vim"
alias gmd="git commit --amend --no-edit"
alias vm3="ssh root@10.70.43.1"
alias vm2="ssh root@10.70.43.8"
alias vm1="ssh root@10.70.43.31"
alias fuck='$(thefuck $(fc -ln -1))'
function mcd() { mkdir $1 && cd $1; }
function gcom() { git commit -m $1}
function gcp() { git cherry-pick $1 }
# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="false"
ESP1="false"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git brew bundle rvm rails ruby bundler rake gem)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/go/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

export EDITOR="vim"
export GOPATH="$HOME/work"

PATH="/usr/local/heroku/bin:$PATH"
if [ "$TMUX" = "" ]; then tmux; fi
alias li='python3 ~/fun/lightning-cd/lightning-cd.py ~/.lightningpath && cd "`cat ~/.lightningpath`"'
alias ansi='cd ~/work/gdeploy && source ~/work/ansi/bin/activate'
alias bstr='cd ~/fun/bookstrs/bookstrs/src && source ~/fun/bookstrs/bookstrs/bookstrs/bin/activate'
export  PYTHONPATH='/home/gem/work/gdeploy'
export GDEPLOY_TEMPLATES=/home/gem/work/gdeploy
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
export GDEPLOY_TEMPLATES=/home/gem/work/gdeploy
export LD_LIBRARY_PATH=:/usr/local/lib:/usr/local/lib
export PKG_CONFIG_PATH=:/usr/local/lib/pkgconfig:/usr/local/lib/pkgconfig
