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

# mac_gen
function mac_gen () {
        if [ "$(id -u)" -eq 0 ]
                then
                printf "Changing MAC as root!"
                ran=$(head /dev/urandom | md5sum); MAC=00:07:${ran:0:2}:${ran:3:2}:${ran:5:2}:${ran:7:2}; echo $MAC #ifconfig wlp4s0 down hw ether $MAC; echo ifconfig wlp4s0:0
        else
                clear
                printf "\033[1m \n\n ${yellow} We're playing a game called ${green} fuck yourself ${yellow}, you go first!! \n\n \033[0m"
                sleep 2
                exit

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
