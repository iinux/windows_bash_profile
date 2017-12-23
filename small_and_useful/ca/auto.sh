#!/bin/sh
#openssl genrsa -out ca.key 2048
#openssl req -new -x509 -key ca.key -out ca.crt -days 36500 -subj /C=CN/ST=Beijing/O=Google\ Internet\ Authority\ G2X/CN=Google\ Internet\ Authority\ G2X
if [ "$2" = "" ]; then
    key=${1}.key
    openssl genrsa -out $key 2048
else
    key=$2
fi

openssl req -new -key $key -out ${1}.csr -subj /C=CN/ST=Beijing/O=*.$1/CN=*.$1

cat << EOF > $1.v3.ext
authorityKeyIdentifier=keyid,issuer
basicConstraints=CA:FALSE
keyUsage = digitalSignature, nonRepudiation, keyEncipherment, dataEncipherment
subjectAltName = @alt_names
[alt_names]
DNS.1 = *.$1
EOF

openssl x509 -req -in ${1}.csr -CA ca.crt -CAkey ca.key -CAcreateserial -out ${1}.crt -days 3650 -extfile $1.v3.ext
# -sha256
