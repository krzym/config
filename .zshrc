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

LINUXOS=`cat /etc/issue |cut -d ' ' -f3`

if [[ "$LINUXOS" == "ArchLinux" ]]
then
    plugins=(git mercurial archlinux python perl)

    # yaourt
    alias yaupgaur='sudo yaourt -Syu --aur'
    alias yaupgdev='sudo yaoirt -Syu --devel'
elif [[ "$LINUXOS" == "openSUSE" ]]
then
    plugins=(git mercurial python perl)

    # zypper
    alias zyup='sudo zypper up' # update
    alias zyin='sudo zypper in' # install
    alias zydel='sudo zypper rm' # remove
    alias zyve='zypper ve' # verify
    alias zyupg='sudo zypper dup' # dist-upgrade
    alias zylist='zypper lu' # list updates
    alias zyreps='zypper se' # search
    alias zysels='zypper ls' # list services
    alias zyrels='zypper lr' # list repos
    alias zycls='sudo zypper clean' # clean cache
    alias zyrepref='sudo zypper ref' # refresh repo
    alias zyrepadd='sudo zypper ar' # add repo
    alias zyrepdel='sudo zypper rr' # remove repo
    alias zyinfo='zypper if' # info
    alias zylockadd='sudo zypper al' # add lock
    alias zylockdel='sudo zypper rl' # remove lock
    alias zylockls='zypper ll' # list locks
    alias zylockcls='sudo zypper cl' # clear unused locks
    alias zyps='zypper ps | less' # list running apps
else
    plugins=(git mercurial python perl)

    # nothing
fi

source $ZSH/oh-my-zsh.sh

# files
alias ll='ls -l'
alias la='ls -la'
alias ltr='ls -ltr'
alias rm='rm -rfv' 
alias rrm='sudo rm -rfv'
alias cp='cp -rpfv' 
alias rcp='sudo cp -rpfv'
alias rmv='sudo mv'

# navigate
alias .='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'

# history
alias h='history'

# network stuff
alias antlp='sudo netstat -antlp'
alias dbox='.dropbox-dist/dropboxd &'

# editor
alias v='vim'
alias rv='sudo vim'
alias l='less'
alias gr='grep --color -r -i'

# system monitoring
alias t='htop'
alias rt='sudo htop'

# system
alias reboot='sudo reboot'
alias off='sudo halt'
alias scr='screen'

# Customize to your needs...
