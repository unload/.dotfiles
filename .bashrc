# Check for an interactive session
[ -z "$PS1" ] && return

# exports
export TZ=UTC
export EDITOR=subl -w
export PATH=$PATH:$HOME/adt-bundle/sdk/tools/:$HOME/adt-bundle/sdk/platform-tools/
export PATH=~/.local/bin:$PATH
export TERM="screen-256color"

# ruby
PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

unset color_prompt force_color_prompt

HISTCONTROL=ignoredups:ignorespace
HISTSIZE=1000
HISTFILESIZE=2000
force_color_prompt=yes

shopt -s histappend
shopt -s checkwinsize

[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

if [ -z "$debian_chroot" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
    color_prompt=yes
    else
    color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi

case "$TERM" in
    xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
    *)
    ;;
esac

if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# aliases
alias ping='ping -c 5'
alias fastping='ping -c 100 -s.2'
alias ipt='sudo /sbin/iptables'
alias iptlist='sudo /sbin/iptables -L -n -v --line-numbers'
alias iptlistin='sudo /sbin/alsaiptables -L INPUT -n -v --line-numbers'
alias iptlistout='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias iptlistfw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=iptlist
alias rm='rm -I --preserve-root'
alias meminfo='free -m -l -t'
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
alias cpuinfo='lscpu'
alias cpuinfo='less /proc/cpuinfo'
alias wget='wget -c'
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias c='clear'
alias myports="netstat -lntp 2>/dev/null | grep -v ' - *$'"

# Python2.7 fix (cause Python3 sucks cocks)
export PATH="/home/arch/local/bin:$PATH"
export PATH="/home/arch/local/Python-2.7/bin:$PATH"

# extract
function extract () {
        if [ -f $1 ] ; then
                case $1 in
                        *.tar.bz2) tar xjf $1 ;;
                        *.tar.gz) tar xzf $1 ;;
                        *.bz2) bunzip2 $1 ;;
                        *.rar) rar x $1 ;;
                        *.gz) gunzip $1 ;;
                        *.tar) tar xf $1 ;;
                        *.tbz2) tar xjf $1 ;;
                        *.tgz) tar xzf $1 ;;
                        *.zip) unzip $1 ;;
                        *.Z) uncompress $1 ;;
                        *) echo "'$1' cannot be extracted via extract()" ;;
                esac
        else
                echo "'$1' is not a valid file"
        fi
}