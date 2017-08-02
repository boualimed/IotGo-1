#!/usr/bin/env bash

set -e

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR/bin/"
echo 'GOPATH:' $GOPATH
echo 'GOBIN:' $GOBIN
go build -race -gcflags "-N -l" src/IotGo/server/server.go 
go build -race -gcflags "-N -l" src/IotGo/client/client.go 

if [ ! -d ./bin ]; then
	mkdir bin
fi

if [ -e ./server ]; then
   mv server ./bin/server
   echo "copy server to ./bin/server"
fi

if [ -e ./client ]; then
	mv client ./bin/client
	echo "copy client to ./bin/client"
fi

export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'build finished'

