#!/bin/sh

if [ ! -f "/usr/bin/utf" ]
then
cp utf /usr/bin
fi

profile=`grep windows_bash_profile /etc/profile`
if [ "$profile" = "" ]
then
block="if [ -f \"/etc/windows_bash_profile/profile\" ]
then
source /etc/windows_bash_profile/profile
fi"
echo "$block" >> /etc/profile
fi
