#!/bin/bash
set -eux

python3.9 -m nuitka \
    --standalone \
    --onefile \
    --plugin-enable=anti-bloat \
    --plugin-enable=data-files \
    --plugin-enable=implicit-imports \
    --python-flag=nosite \
    --prefer-source-code \
    --remove-output \
    --full-compat \
    --lto=yes \
    --assume-yes-for-downloads \
    --static-libpython=yes \
    --show-progress \
    --include-data-file="./src/data.txt=./src/" \
    src/app.py

mv app.bin /output
