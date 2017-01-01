#!/bin/sh
export PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n\[\033[32m\]\t \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] # '
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
alias port='utf netstat -ano | grep '
alias pss='utf tasklist '
alias ping='utf ping '
alias powercfg='utf powercfg '
alias ftp='winpty ftp'
alias ifconfig='utf ipconfig'
alias killl='utf taskkill '
alias tftp='utf tftp '
alias cdold='cd $OLDPWD'
alias artisan='./artisan '
alias cp='cp -i '
alias mv='mv -i '
alias arp='utf arp '
if [ -f "/etc/windows_bash_profile/local_profile" ]
then 
source /etc/windows_bash_profile/local_profile
fi
