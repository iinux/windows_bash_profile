#!/bin/sh
export PS1='\[\033]0;$TITLEPREFIX:${PWD//[^[:ascii:]]/?}\007\]\n \[\033[33m\]\w\[\033[36m\]`__git_ps1`\[\033[0m\] \t # '
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"
alias arp='utf arp '
alias artisan='./artisan '
alias at="utf at "
alias cal="busybox cal "
alias cdold='cd $OLDPWD'
alias cncomposer='composer config repo.packagist composer https://packagist.phpcomposer.com'
alias cp='cp -i '
alias du1='du --max-depth=1 -h'
alias duu='du --max-depth=0 -h'
alias ftp='winpty ftp'
alias gitci="git pull;echo -e \"\033[47;31m YOU MAY BE NEED GIT PUSH \033[0m\";git ci -m "
alias ifconfig='utf ipconfig'
alias java="utf java "
alias javac="utf javac "
alias killl='utf taskkill -f -pid '
alias msg='utf msg '
alias mv='mv -i '
alias net='utf net '
alias netsh='utf netsh '
alias netstat='utf netstat -n '
alias nfsadmin='utf nfsadmin ' # refer to https://technet.microsoft.com/zh-cn/library/cc732345(v=ws.11).aspx
alias nslookup='winpty nslookup '
alias ping='utf ping '
alias port='utf netstat -ano | grep '
alias powercfg='utf powercfg '
alias pss='utf tasklist '
alias route='utf route '
alias runas='winpty runas'
alias schtasks="utf schtasks "
alias tskill='utf tskill '
alias tasklist="utf tasklist "
alias taskkill="utf taskkill "
alias testnet="ping www.baidu.com -t"
alias tftp='utf tftp '
alias tracert='utf tracert '
alias vihosts='vi /c/Windows/System32/drivers/etc/hosts '

export PATH=$PATH:/etc/windows_bash_profile/bin
export HISTTIMEFORMAT="%F %T  "

if [ -f "/etc/windows_bash_profile/local_profile" ]
then 
source /etc/windows_bash_profile/local_profile
fi
