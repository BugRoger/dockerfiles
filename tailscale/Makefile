RELEASE ?= v1.70.0
BUILD   ?= $(shell date +%Y%m%d%H%M)
VERSION := $(RELEASE)-$(BUILD)
IMAGE   := bugroger/tailscale

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker buildx build --platform linux/amd64 --build-arg RELEASE=$(RELEASE) -t $(IMAGE):$(VERSION) --rm --push .

