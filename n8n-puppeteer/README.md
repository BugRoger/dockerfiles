# n8n-puppeteer-docker

Build a [n8n docker image](https://github.com/n8n-io/n8n/tree/master/docker/images/n8n) with [n8n-nodes-puppeteer](https://github.com/drudge/n8n-nodes-puppeteer) installed.

## Build

Execute `build.sh` to build docker image `n8n-puppeteer:<version>` using n8n version from `env.sh` with:
* [n8n-nodes-puppeteer](https://github.com/drudge/n8n-nodes-puppeteer)
* [chromium on alpine](https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-on-alpine)

```
docker build --build-arg N8N_VERSION=0.181.2 -t n8n-puppeteer:0.181.2 .
```

## Run

Execute `run.sh` to run docker image `n8n-puppeteer:<version>` with:
* `--privileged` required to allow chrome sandbox
* `--shm-size=1gb` for shared memory >64mb (docker default)

```bash
docker run -it --rm --privileged --shm-size=1gb --name n8n -p 5678:5678 -v ~/.n8n:/home/node/.n8n n8n-puppeteer:0.181.2
```

## Ressources

* [Puppeteer Troubleshooting - Running on Alpine](https://github.com/puppeteer/puppeteer/blob/main/docs/troubleshooting.md#running-on-alpine)
* [Stack Overflow - Node.js + Puppeteer on Docker, No usable sandbox](https://stackoverflow.com/questions/62345581/node-js-puppeteer-on-docker-no-usable-sandbox)