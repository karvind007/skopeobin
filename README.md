# skopeobin

## Install

```bash
docker build . -t skopeo:1.7.0
docker run -it -v /tmp/skopeobin:/usr/local/go -P skopeo:1.7.0
```