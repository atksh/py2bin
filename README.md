
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
docker run --rm -it -v $(pwd):/root --workdir /root debian:bullseye-slim ./app.bin --appimage-extract-and-run
```
