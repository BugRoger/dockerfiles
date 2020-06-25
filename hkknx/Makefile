HKKNX   ?= 1.1.0
BUILD   ?= $(shell date +%Y%m%d%H%M)
VERSION := $(HKKNX)-$(BUILD)
IMAGE   := bugroger/hkknx

.PHONY: all build push
all: build push

build:
	docker buildx build --progress=plain --push --platform linux/amd64,linux/arm --build-arg HKKNX=$(HKKNX) -t $(IMAGE):$(VERSION) -t $(IMAGE):$(VERSION) --rm .
	docker pull $(IMAGE):$(VERSION)
	docker tag $(IMAGE):$(VERSION) $(IMAGE):latest
	docker push $(IMAGE):latest

push:
	docker push $(IMAGE)
