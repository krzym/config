# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="candy"

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
DEBIAN=`grep "Debian GNU/Linux" /etc/issue`
MINT=`grep "Mint GNU/Linux" /etc/issue`

# true or false
VM="false"

# set PATH 
export PATH="$PATH:$HOME/bin"

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
elif [ $DEBIAN ]
then
	plugins=(git mercurial python perl debian)
else
    plugins=(git mercurial python perl)

    # do nothing
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

# FS
alias rdd='sudo dd if=$1 of=$2'
alias rfdiskls='sudo fdisk -l'

# navigate
alias 1.='cd ..'
alias 2.='cd ../..'
alias 3.='cd ../../..'
alias 4.='cd ../../../..'
alias 5.='cd ../../../../..'

# history
alias h='history'

# network stuff
alias antlp='sudo netstat -antlp'

# ProcessID
alias psg='ps faxvvvv | gr'
alias rpsg='sudo ps faxvvvv | gr'

# OwnCloud
# mount enc ownCloud
if pgrep encfs
then
   	PID=`pgrep encfs` > /dev/null 2>&1
else
	PID="0" > /dev/null 2>&1
fi

# is encfs mounted?
if [ -d $HOME/ownCloud ]
then
	if [ ! -e /proc/$PID ]
	then
    	encfs $HOME/ownCloud $HOME/dec
	fi
	alias osync='owncloud'
fi
# manuel mount
alias ownenc='encfs $HOME/ownCloud $HOME/dec'

# editor
alias v='vim'
alias rv='sudo vim'
alias l='less'
alias gr='grep --color -r -i'

# system monitoring
alias t='htop'
alias rt='sudo htop'

# system
# virsh: VM 
# web
# web-tor
# email
# vpn
function f_shutdown(){
	if [[ "$VM" == "true" ]]
	then
		array=('web' 'web-tor' 'email' 'vpn');
		for i in ${array[@]}
		do 
			echo "shutdown $i "
			sudo virsh shutdown $i
			echo "ok" 
		done
		sleep 30
	fi

	if [[ "1" == "$1" ]]
	then
		sudo reboot	
	elif [[ "2" == "$1" ]]
	then
		sudo shutdown -h now
	else
		echo "$1 - unknow code!"
	fi	

}

alias reboot='f_shutdown "1"'
alias off='f_shutdown "2"'
alias scr='screen'

# PERL
alias pcpan='perl -e shell -MCPAN'
alias rpcpan='sudo perl -e shell -MCPAN'

# kill 
alias rkill9='sudo kill -9'
alias rkill15='sudo kill -15'
alias rkillall='sudo killall'
alias rpkill='sudo pkill'

# nmap
alias nmapst='sudo nmap -sT -v -P0 -A'
alias nmapss='sudo nmap -sS -v -P0 -A'
alias nmapsx='sudo nmap -sX -v -P0 -A'
alias nmapstall='sudo nmap -sT -v -P0 -A -p1-65535'
alias nmapssall='sudo nmap -sS -v -P0 -A -p1-65535'
alias nmapsxall='sudo nmap -sX -v -P0 -A -p1-65535'
alias nmapsa='sudo nmap -sA -v -P0 -A'
alias nmapsw='sudo nmap -sW -v -P0 -A'
alias nmapsm='sudo nmap -sM -v -P0 -A'
alias nmapsaall='sudo nmap -sA -v -P0 -A -p1-65535'
alias nmapswall='sudo nmap -sW -v -P0 -A -p1-65535'
alias nmapsmall='sudo nmap -sM -v -P0 -A -p1-65535'
alias nmapservices='sudo nmap -sV'



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
	elif [ $DEBIAN ]
	then
        printf "\t+----- Debian | Ubuntu | Mint ------------------------------------------------------------------------------------------+\n"
        printf "\t+----- command \t\t\t +----- description\n"
		printf "\t+ ag \t\t\t\t\t# apt-get\n"
		printf "\t+ ap \t\t\t\t\t# aptitude\n"
		printf "\t+ acs \t\t\t\t\t# apt-cache search\n"
		printf "\t+ aps \t\t\t\t\t# aptitude search\n"
		printf "\t+ as \t\t\t\t\t# aptitude search inkl. Pkg-description and Pkg-version\n"
		printf "\t+ afs \t\t\t\t\t# apt-file search --regexp\n"
		printf "\t+ asrc \t\t\t\t\t# apt-get source\n"
		printf "\t+ app \t\t\t\t\t# apt-cache policy\n"
		printf "\t+ aac \t\t\t\t\t# Autoclean\n"
		printf "\t+ abd \t\t\t\t\t# Build *.deb\n"
		printf "\t+ ac \t\t\t\t\t# Clean\n"
		printf "\t+ ad \t\t\t\t\t# Update Repo\n"
		printf "\t+ adg \t\t\t\t\t# Update Repo and Upgrade System\n"
		printf "\t+ adu \t\t\t\t\t# Update Repo und Upgrade complete System\n"
		printf "\t+ ag \t\t\t\t\t# Only upgrade\n"
		printf "\t+ ai \t\t\t\t\t# Install package from Repo\n"
		printf "\t+ ap \t\t\t\t\t# Remove package and clean config\n"
		printf "\t+ ar \t\t\t\t\t# Remove package\n"
		printf "\t+ ads \t\t\t\t\t# Only apt-get: dselect-upgrade\n"
		printf "\t+ dia \t\t\t\t\t# dpkg install all *.dep-files\n"
		printf "\t+ di \t\t\t\t\t# dpkg install\n"
		printf "\t+ kclean \t\t\t\t# Remove ALL kernel images and headers except the one in use\n"
		printf "\t+ allpkg \t\t\t\t# Print all installed packages\n"
		printf "\t+ mydeb \t\t\t\t# Create a basic *.deb package\n"
		printf "\t+ apt-copy \t\t\t\t# Create a simple script that can be use to 'dublicate' a system\n"
		printf "\t+ apt-history \t\t\t\t# {install|upgrade|remove|rollback|list}\n"
		printf "\t+ kerndeb \t\t\t\t# Building a kernel-package\n"
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
    printf "\t+ ownenc \t\t\t\t\t# mount encfs for owncloud\n"
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
	printf "\t+ rdd \t\t\t\t\t# dd if=$1 of=$2\n"
	printf "\t+ rfdiskls \t\t\t\t# fdisk -l\n"
	printf "\t+ rkill9 \t\t\t\t# kill -9 <PID>\n"
	printf "\t+ rkill15 \t\t\t\t# kill -15 <PID>\n"
	printf "\t+ rkillall \t\t\t\t# killall <name>\n"
	printf "\t+ rpkill \t\t\t\t# pkill <name>\n"
	printf "\t+ psg \t\t\t\t\t# ps faxvvvv | grep ....\n"
	printf "\t+ rpsg \t\t\t\t\t# sudo ps faxvvvv | grep ....\n"
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

# FORTUNE
#
printf "\n"
fortune
printf "\n"
# END
