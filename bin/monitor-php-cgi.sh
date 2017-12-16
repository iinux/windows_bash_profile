#! /bin/sh
date
echo 'monitor start ...'
while [ 1 ]; do
	php_cgi_process=`ps aux | grep php-cgi | wc -l`
	if [ $php_cgi_process == 0 ]; then
		date
		echo 'now start it'
		/bin/ls
	fi
	sleep 1
done
