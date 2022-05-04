#!/bin/bash
set -eux

docker build -t py2bin .
rm -rf .tmp || true
mkdir -p .tmp
docker run --rm -it --privileged -v $(pwd)/.tmp:/output py2bin
mv --force .tmp/app.bin .
rm -rf output
