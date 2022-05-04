
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
docker run --rm -it -v $(pwd):/root --workdir /root --env APPIMAGE_EXTRACT_AND_RUN=1 debian:bullseye-slim ./app.bin
```
