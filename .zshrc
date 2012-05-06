# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="arrow"

# Example aliases
#alias zshconfig="mate ~/.zshrc"
#alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

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

#if [ -d /proc/acpi/battery/BAT0/ ]
#    then 
#    plugins=(git archlinux mercurial python perl battery)
#elif [ -d  /sys/class/power_supply/BAT1/ ]
#    then
#    plugins=(git archlinux mercurial python perl battery)
#else

plugins=(git mercurial archlinux python perl)

source $ZSH/oh-my-zsh.sh

# show files
alias ,ll='ls -l'
alias ,la='ls -la'
alias ,ltr='ls -ltr'

# navigate
alias .='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'

# history
alias ,h='history'

# network stuff
alias ,antlp='sudo netstat -antlp'
alias ,db='.dropbox-dist/dropboxd &'

# editor
alias ,v='vim'
alias ,sv='sudo vim'
alias ,l='less'

# system monitoring
alias ,t='htop'
alias ,st='sudo htop'

# system
alias ,reboot='sudo reboot'
alias ,off='sudo halt'

# Customize to your needs...
