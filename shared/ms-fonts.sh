#!/usr/bin/env bash

# Download and extract ms fonts

mkdir -p ~/ms-fonts

docker run --rm \
  -v ~/ms-fonts:/out:Z \
  -e OWNER="$(id -u):$(id -g)" \
  -e DEBIAN_FRONTEND=noninteractive \
  debian:stable-slim bash -c '
    apt-get update -qq >/dev/null 2>&1
    apt-get install -y -qq curl cabextract ca-certificates >/dev/null 2>&1
    cd /tmp
    curl -fLO --retry 3 "https://downloads.sourceforge.net/corefonts/{andale32,arial32,arialb32,comic32,courie32,georgi32,impact32,times32,trebuc32,verdan32,webdin32}.exe"
    cabextract -q -d /out *.exe
    chown -R "$OWNER" /out
    ls /out
  '
