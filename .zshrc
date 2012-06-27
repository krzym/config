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

ARCH=`grep "Arch Linux" /etc/issue`
SUSE=`grep "openSUSE" /etc/issue`

# set PATH 
PATH=$PATH:/usr/local/sbin:/usr/sbin:/sbin

if [ $ARCH ]
then
    plugins=(git mercurial archlinux python perl)

    # yaourt
    alias yaupgaur='sudo yaourt -Syu --aur'
    alias yaupgdev='sudo yaoirt -Syu --devel'
elif [ $SUSE ]
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

# Dropbox
# mount enc dropbox
ENCFSPID="/tmp/encfs.pid"

if [ -f $ENCFSPID ]
then
    PID=`cat $ENCFSPID`
else
    PID=0
fi

if [ ! -e /proc/$PID -a /proc/$PID/exe ]
then
    encfs $HOME/Dropbox/enc $HOME/dec 
    # $$ oder $! ????
    echo $$ > $ENCFSPID
fi
alias dbox='~/.dropbox-dist/dropboxd &'

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

# PERL
alias pcpan='perl -e shell -MCPAN'
alias rpcpan='sudo perl -e shell -MCPAN'

function f_help(){
    printf "\t+----------------------------------------------------------------------------------------------------------------------+\n"
    if [ $ARCH ]
    then
        printf "\t+----- Arch Linux -----------------------------------------------------------------------------------------------------+\n"
        printf "\t+----- command \t\t\t +----- description\n\n"
        printf "\t+----- yaourt \t\t\t +---------------------\n"
        printf "\t+ yaupgaur \t\t\t\t# upgrade Aur\n"
        printf "\t+ yaupgdev \t\t\t\t# upgrade Devel\n"
        printf "\t+ yaconf \t\t\t\t# Fix all configuration files with vimdiff\n"
        printf "\t+ yaupg \t\t\t\t# Synchronize with repositories before upgrading\n"
        printf "\t+ yasu \t\t\t\t\t# Same as yaupg, but without confirmation \n"
        printf "\t+ yain \t\t\t\t\t# Install\n"
        printf "\t+ yains \t\t\t\t# Install from a local file\n"
        printf "\t+ yare \t\t\t\t\t# Remove\n"
        printf "\t+ yarem \t\t\t\t# Remove the specified package(s), its conf and unneeded dependencies\n"
        printf "\t+ yarep \t\t\t\t# Display information\n"
        printf "\t+ yaloc \t\t\t\t# Display information in local database\n"
        printf "\t+ yareps \t\t\t\t# Search \n"
        printf "\t+ yalocs \t\t\t\t# Search for package(s) in the local database\n"
        printf "\t+ yaupd \t\t\t\t# Update and refresh the local package and ABS databases\n"
        printf "\t+ yainsd \t\t\t\t# Install given package(s) as dependencies of another package\n"
        printf "\t+ yamir \t\t\t\t# Force refresh of all package lists after updating /etc/pacman.d/mirrorlist\n"
        printf "\n\t+----- pacman \t\t\t +---------------------\n"
        printf "\t+ pacupg \t\t\t\t# Upgrade\n"
        printf "\t+ pacin \t\t\t\t# Install\n"
        printf "\t+ pacins \t\t\t\t# Install from a local file\n"
        printf "\t+ pacre \t\t\t\t# Remove\n"
        printf "\t+ pacrem \t\t\t\t# Remove the specified package(s), its conf and unneeded dependencies\n"
        printf "\t+ pacrep \t\t\t\t# Display information\n"
        printf "\t+ pacreps \t\t\t\t# Search\n"
        printf "\t+ pacloc \t\t\t\t# Display information in local database\n"
        printf "\t+ paclocs \t\t\t\t# Search for package(s) in the local database\n"
        printf "\t+ pacupd \t\t\t\t# Update and refresh the local package and ABS databases\n"
        printf "\t+ pacinsd \t\t\t\t# Install given package(s) as dependencies of another package\n"
        printf "\t+ pacmir \t\t\t\t# Force refresh of all package lists\n"
        printf "\t+ paclist \t\t\t\t# https://bbs.archlinux.org/viewtopic.php?id=93683\n"
        printf "\t+ paclsorphans \t\t\t\t# ?\n"
        printf "\t+ pacrmorphans \t\t\t\t# ?\n"

    elif [ $SUSE ]
    then 
        printf "\t+----- OpenSuSE -------------------------------------------------------------------------------------------------------+\n"
        printf "\t+----- command \t\t\t +----- description\n"
        printf "\t+ zyup \t\t\t\t\t# update\n"
        printf "\t+ zyin \t\t\t\t\t# install\n"
        printf "\t+ zydel \t\t\t\t# remove\n"
        printf "\t+ zyve \t\t\t\t\t# verify\n"
        printf "\t+ zyupg \t\t\t\t# dist-upgrade\n"
        printf "\t+ zylist \t\t\t\t# list updates\n"
        printf "\t+ zyreps \t\t\t\t# search\n"
        printf "\t+ zysels \t\t\t\t# list services\n"
        printf "\t+ zyrels \t\t\t\t# list repos\n"
        printf "\t+ zycls \t\t\t\t# clean cache\n"
        printf "\t+ zyrepref \t\t\t\t# refresh repo\n"
        printf "\t+ zyrepadd \t\t\t\t# add repo\n"
        printf "\t+ zyrepdel \t\t\t\t# remove repo\n"
        printf "\t+ zyinfo \t\t\t\t# info\n"
        printf "\t+ zylockadd \t\t\t\t# add lock\n"
        printf "\t+ zylockdel \t\t\t\t# remove lock\n"
        printf "\t+ zylockls \t\t\t\t# list locks\n"
        printf "\t+ zylockcls \t\t\t\t# clear unsued locks\n"
        printf "\t+ zyps \t\t\t\t\t# list running apps\n"
    else
        printf "\t+----- nothing --------------------------------------------------------------------------------------------------------+\n"
    fi
    printf "\t+----- generic --------------------------------------------------------------------------------------------------------+\n"
    printf "\t+----- command \t\t\t +----- description\n"
    printf "\t+ ll \t\t\t\t\t# ls -l\n"
    printf "\t+ la \t\t\t\t\t# ls -la\n"
    printf "\t+ ltr \t\t\t\t\t# ls -ltr\n"
    printf "\t+ rm \t\t\t\t\t# rm -rfv <source>\n"
    printf "\t+ rrm \t\t\t\t\t# sudo rm -rfv <source>\n"
    printf "\t+ cp \t\t\t\t\t# cp -rpfv <source>\n"
    printf "\t+ rcp \t\t\t\t\t# sudo cp -rpfv <source>\n"
    printf "\t+ rmv \t\t\t\t\t# sudo mv <source> <dest>\n"
    printf "\t+ . \t\t\t\t\t# cd ..\n"
    printf "\t+ 2. \t\t\t\t\t# cd ../..\n"
    printf "\t+ 3. \t\t\t\t\t# cd ../../..\n"
    printf "\t+ 4. \t\t\t\t\t# cd ../../../..\n"
    printf "\t+ 5. \t\t\t\t\t# cd cd ../../../../..\n"
    printf "\t+ h \t\t\t\t\t# history\n"
    printf "\t+ antlp \t\t\t\t# sudo netstat -antlp\n"
    printf "\t+ dbox \t\t\t\t\t# .dropbox-dist/dropboxd &\n"
    printf "\t+ v \t\t\t\t\t# vim\n"
    printf "\t+ rv \t\t\t\t\t# sudo vim\n"
    printf "\t+ l \t\t\t\t\t# less <source>\n"
    printf "\t+ gr \t\t\t\t\t# grep --color -r -i\n"
    printf "\t+ t \t\t\t\t\t# htop\n"
    printf "\t+ rt \t\t\t\t\t# sudo htop\n"
    printf "\t+ reboot \t\t\t\t# sudo reboot\n"
    printf "\t+ off \t\t\t\t\t# sudo halt\n"
    printf "\t+ src \t\t\t\t\t# screen\n"
    printf "\t+ zshreload \t\t\t\t# reload .zshrc\n"
    printf "\t+ pcpan \t\t\t\t# perl cpan\n"
    printf "\t+ rpcpan \t\t\t\t# sudo perl cpan\n"
    printf "\t+ pwgen \t\t\t\t# pwgen <#> #generate random password\n"
    printf "\t+----------------------------------------------------------------------------------------------------------------------+\n"    
}

# pw Random 
function f_pwrand(){
    l=$1
    tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${l} | xargs
}

alias pwgen='f_pwrand'


# ZSH command help
alias zshhelp='f_help'
alias zshreload='source ~/.zshrc'


# Customize to your needs...
