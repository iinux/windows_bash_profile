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
alias cdold='cd "$OLDPWD"'
alias cncomposer='composer config repo.packagist composer https://packagist.phpcomposer.com'
alias cp='cp -i '
alias du1='du --max-depth=1 -h'
alias duu='du --max-depth=0 -h'
alias ftp='winpty ftp'
alias ga="git add "
alias gb="go build "
alias gitci="git pull;echo -e \"\033[47;31m YOU MAY BE NEED GIT PUSH \033[0m\";git ci -m "
alias grep='grep --color '
alias ifconfig-a='utf ipconfig'
alias ifconfig-dns="utf ipconfig -all | grep -v fec0 | grep  'DNS 服务器\|DNS Server' -B 16 -A 2"
alias ifconfig='utf ipconfig | grep IPv4 -B 4 -A 2'
alias java="utf java "
alias javac='utf javac -encoding utf8 '
alias killl='utf taskkill -f -pid '
alias msg='utf msg '
alias mv='mv -i '
alias mysql='winpty mysql'
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
alias shutdown='utf shutdown '
alias tskill='utf tskill '
alias tasklist="utf tasklist "
alias taskkill="utf taskkill "
alias telnet="winpty telnet "
alias testnet="ping www.baidu.com -t"
alias tftp='utf tftp '
alias tracert='utf tracert '
alias uptime='net stats srv '
alias viewpath='echo $PATH | xargs -d: -n 1 echo | sort'
alias vihosts='vi /c/Windows/System32/drivers/etc/hosts '
alias vissh='vi ~/.ssh/config '

#alias clip1='xclip -o > /home/abui/www/xclip1'
#alias clip4='python /home/abui/py/clip.py'

#PS1='`a=$?;if [ $a -ne 0 ]; then a="  "$a; echo -ne "\[\e[s\e[1A\e[$((COLUMNS-2))G\e[31m\e[1;41m${a:(-3)}\e[u\]\[\e[0m\e[7m\e[2m\]"; fi`\[\e[1;32m\]\u@\h:\[\e[0m\e[1;34m\]\W\[\e[1;34m\]\$ \[\e[0m\]'
#referer http://wowubuntu.com/bash-prompt.html

export PATH=$PATH:/etc/windows_bash_profile/bin
export HISTTIMEFORMAT="%F %T  "
export HISTIGNORE="pwd:ls:ll:"

if [ -f "/etc/windows_bash_profile/local_profile" ]
then 
source /etc/windows_bash_profile/local_profile
fi
