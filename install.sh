#!/usr/bin/env bash

set -e

CURDIR=`pwd`
OLDGOPATH="$GOPATH"
OLDGOBIN="$GOBIN"
export GOPATH="$CURDIR"
export GOBIN="$CURDIR/bin/"
echo 'GOPATH:' $GOPATH
echo 'GOBIN:' $GOBIN

go get github.com/codegangsta/gin

export GOPATH="$OLDGOPATH"
export GOBIN="$OLDGOBIN"

echo 'build finished'

