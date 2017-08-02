#!/usr/bin/env bash

set -e

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR/bin/"
echo 'GOPATH:' $GOPATH
echo 'GOBIN:' $GOBIN
echo 'pack started'
if [ -a ebike-factory-api ]; then
	rm -rf ebike-factory-api
fi
if [ -a ebike-factory-api.tar.gz ];then
	rm -rf ebike-factory-api.tar.gz
fi
mkdir ebike-factory-api
mkdir -p ebike-factory-api/bin
mkdir -p ebike-factory-api/config

cp bin/app ebike-factory-api/bin
cp config/env.ini ebike-factory-api/config/ 
cp run.sh ebike-factory-api/

tar -zcvf ebike-factory-api.tar.gz ebike-factory-api/

if [ -a ebike-factory-api ]; then
	rm -rf ebike-factory-api
fi

export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'pack finished'

