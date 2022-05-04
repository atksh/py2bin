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
    --python-flag=nosite,-O \
    --assume-yes-for-downloads \
    --static-libpython=yes \
    --show-progress \
    --include-data-file="./src/data.txt=./src/" \
    src/app.py

./app.bin --appimage-extract
rm ./app.bin
cd squashfs-root
upx -9 app
cd ../
appimagetool --comp xz squashfs-root
mv app* app.bin

mv app.bin /output
