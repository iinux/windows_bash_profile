#!/bin/sh

set -x

if [ "$1" = "-h" ]; then
    echo "
    examples:
    ./auto.sh custom [keyFile] [csrFile] [extFile] [crtFile] [domain]
    ./auto.sh custom nginx.key 0golang.org.csr 0golang.org.v3.ext 0golang.org.crt golang.org
    ./auto.sh <domain> [keyFile]
    ./auto.sh treevc.net nginx.key
    ./auto.sh treevc.net
    "
    exit
fi

#openssl genrsa -out ca.key 2048
#openssl req -new -x509 -key ca.key -out ca.crt -days 36500 -subj /C=CN/ST=Beijing/O=Google\ Internet\ Authority\ G2X/CN=Google\ Internet\ Authority\ G2X

if [ "$1" = "custom" ]; then
    keyFile=$2
    csrFile=$3
    extFile=$4
    crtFile=$5
    domain=$6
else
    csrFile=${1}.csr
    extFile=$1.v3.ext
    crtFile=${1}.crt
    domain=*.$1
    if [ "$2" = "" ]; then
        keyFile=${1}.key
        openssl genrsa -out $keyFile 2048
    else
        keyFile=$2
    fi
fi

openssl req -new -key $keyFile -out $csrFile -subj /C=CN/ST=Beijing/O=$domain/CN=$domain

cat << EOF > $extFile
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = $domain
EOF

openssl x509 -req -in $csrFile -CA ca.crt -CAkey ca.key -CAcreateserial -out $crtFile -days 3650 -extfile $extFile
# -sha256
