#!/bin/bash

set -v
GOROOT=$(go env GOROOT)
GIT_DIR="$GOROOT/.git" git rev-parse --verify HEAD

go version
go test -cover github.com/aybabtme/hangcover
