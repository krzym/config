# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
#CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)

if [ -d /proc/acpi/battery/BAT0/ ]; then 
    echo ">> laptop"
    plugins=(git archlinux mercurial vi-mode python perl battery)
else
    echo ">> desktop"
    plugins=(git archlinux mercurial vi-mode python perl)
fi

source $ZSH/oh-my-zsh.sh

alias ll='ls -l'
alias lla='ls -la'
alias netantlp='sudo netstat -antlp'
alias v='vim'
alias t='htop'
alias drbox='.dropbox-dist/dropboxd &'
alias .='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'

# Customize to your needs...
