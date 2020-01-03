#!/bin/bash
##############################################################################
#   Filename: .bashrc
#
# Sections:
#   01. Enviorment Variables 
#   02. Aliases
#   03. Other scripts
##############################################################################

##############################################################################
# 01. Enviorment Variables 
##############################################################################
# Shell prompt
CLB="\[\e[1;34m\]" # color light blue
CS="\[\e[m\]" # color stop
export PS1="$CLB\w$CS \$ "

# misc
export VISUAL=vim
export EDITOR="$VISUAL"
export PYTHONSTARTUP=~/.pythonrc
#export DEFAULT_CHEAT_DIR='~/dotfiles/cheats'
export CHEAT_USER_DIR="$HOME/dotfiles/cheats"

if [ -d /usr/local/go ]; then export GOROOT=/usr/local/go; fi
if [ -d "$HOME/projects/go" ]; then
    export GOROOT=/usr/local/go
    export GOPATH="$HOME/projects/go";
    if [ -d "$HOME/projects/go/bin" ]; then export PATH="$HOME/projects/go/bin:$PATH"; fi
fi
export GO111MODULE=on

# PATH
if [ -d "$HOME/bin" ]; then export PATH="$HOME/bin:$PATH"; fi
if [ -d "$HOME/dotfiles/commands" ]; then export PATH="$HOME/dotfiles/commands:$PATH"; fi
if [ -d "$HOME/.npm/bin" ]; then export PATH="$HOME/.npm/bin:$PATH"; fi
if [ -d "$HOME/.local/bin" ]; then export PATH="$HOME/.local/bin:$PATH"; fi
#export PATH="/usr/local/go/bin:$PATH"
#export PATH="/usr/local/opt/go/libexec/bin:$GOPATH/bin:$PATH"
#export PATH="/usr/lib/ccache:$PATH"
#export PATH="$HOME/apps/go1.11.2/bin:$PATH"
if [ -d "/usr/local/go/bin" ]; then export PATH="/usr/local/go/bin:$PATH"; fi

# python viertualenvs
if [ -s $HOME/.local/bin/virtualenvwrapper.sh ]; then
    export WORKON_HOME=$HOME/.virtualenvs
    export PROJECT_HOME=$HOME/projects
    export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
    source $HOME/.local/bin/virtualenvwrapper.sh
fi
if [ -s /usr/share/virtualenvwrapper/virtualenvwrapper.sh ]; then
  source /usr/share/virtualenvwrapper/virtualenvwrapper.sh
fi

# setup sassc for vippsweb
if [ -s "$HOME/apps/sassc-3.4.7/bin/sassc" ]; then
    export SASS_LIBSASS_PATH="$HOME/apps/libsass-3.4.5"
    export SASS_SPEC_SASS="$HOME/apps/sass-spec-3.5.4"
    export PATH="$HOME/apps/sassc-3.4.7/bin:$PATH"
    export PATH="$HOME/apps/sass2scss-1.1.0/:$PATH"
fi

# nvm (node version manager)
if [ -d "$HOME/.nvm" ]; then
    export NVM_DIR="$HOME/.nvm"
    \. "$NVM_DIR/nvm.sh"  # This loads nvm 
    \. "$NVM_DIR/bash_completion"
fi

##############################################################################
# 02. Aliases                                                                #
##############################################################################
alias ls="ls --color"
alias ll="ls -l"
alias ff="find . -name"
alias default-prompt="export PS1='$PS1'"
alias simple-prompt="export PS1='\$ '"
alias grep='grep --color'
alias nm='wicd-curses' # network manager
alias refresh-wifi='sudo iwlist wlp4s0 scan'
alias am='alsamixer'
alias pc='pavucontrol' # pulseaudio controll
alias mm='arandr' # monitor manager
alias nosleep='caffeinate time cat'
yr () { curl "wttr.in/$@"; }

# git
alias gs="git status"

alias gb="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:yellow)%(refname:short)%(color:reset) - %(color:red)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:green)%(committerdate:relative)%(color:reset))'"
alias gl="git log --decorate --oneline --left-right -n 20"
alias gd="git diff"
alias gds="git diff --stat"
alias gdc="git diff --word-diff=color"
alias gg='git grep -n'
alias ggg="git grep -C2 -n --heading --show-function"

# misc
alias rmorig='for file in $(find . -name "*.orig"); do rm $file; done;'
alias date-iso='date --iso-8601'
alias open='xdg-open $@ &> /dev/null'
alias simple='python2 -m SimpleHTTPServer 3000'
alias octave='octave-cli'
alias ports-who='netstat -tulpn'
alias path='echo "$PATH" | sed "s/:/:\n/g"'
alias kantega-vpn='/opt/cisco/anyconnect/bin/vpnui'
alias compose-grep='cat /usr/share/X11/locale/en_US.UTF-8/Compose | grep -i'

alias disable-touchpad='xinput set-prop 10 "Device Enabled" 0'
alias enable-touchpad='xinput set-prop 10 "Device Enabled" 1'

alias config-java='sudo update-alternatives --config java'
alias config-javac='sudo update-alternatives --config javac'

# spelling errors
alias cod=code
alias chat=cheat

# docker
alias d=docker
alias dc=docker-compose
alias dcu='docker-compose up'
alias dcub='docker-compose up --build'
alias dcp='docker-compose ps'


##############################################################################
# 03. Functions
##############################################################################



##############################################################################
# 04. Local stuff
##############################################################################
if [ -f $HOME/.bashrc_local ]; then
    source $HOME/.bashrc_local
fi


