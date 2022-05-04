#!/bin/bash
set -eux

python3.9 -m nuitka \
    --clang \
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
    --python-flag=nosite,-O \
    --assume-yes-for-downloads \
    --static-libpython=yes \
    --show-progress \
    --include-data-file="./src/data.txt=./src/" \
    src/app.py

mv app.bin /output
