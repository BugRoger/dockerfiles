RELEASE ?= v1.38.1
BUILD   ?= $(shell date +%Y%m%d%H%M)
VERSION := $(RELEASE)-$(BUILD)
IMAGE   := bugroger/tailscale

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --build-arg RELEASE=$(RELEASE) -t $(IMAGE):$(VERSION) --rm --push .

