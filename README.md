
### build

```bash
sh build.sh
```

### run
```bash
./app.bin
```

### run in docker
```bash
docker run --rm -it -v $(pwd):/root --workdir /root debian bash -c "./app.bin --appimage-extract && ./squashfs-root/app"
```
