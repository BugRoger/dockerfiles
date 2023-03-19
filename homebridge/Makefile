RELEASE ?= 2023-01-08
BUILD   ?= $(shell date +%Y%m%d%H%M)
VERSION := $(RELEASE)-$(BUILD)
IMAGE   := bugroger/homebridge

.PHONY: all build 
all: build 

build:
	docker buildx build --push --platform linux/amd64 --build-arg RELEASE=$(RELEASE) -t $(IMAGE):latest -t $(IMAGE):$(VERSION) -t $(IMAGE):$(RELEASE) --rm .
