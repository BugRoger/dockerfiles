HKKNX   ?= 1.1.0
BUILD   ?= $(shell date +%Y%m%d%H%M)
VERSION := $(HKKNX)-$(BUILD)
IMAGE   := bugroger/hkknx

.PHONY: all build push
all: build push

build:
	docker buildx build --push --platform linux/amd64,linux/arm --build-arg HKKNX=$(HKKNX) -t $(IMAGE):latest -t $(IMAGE):$(VERSION) --rm .

push:
	docker push $(IMAGE)
