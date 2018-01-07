IMAGE                 := bugroger/cuda
VERSION               := 8.0.61_375.26
NVIDIA_DRIVER_VERSION := 384.90

.PHONY: build
build:
	docker build --build-arg NVIDIA_DRIVER_VERSION=$(NVIDIA_DRIVER_VERSION) -t $(IMAGE):$(VERSION) .

.PHONY: publish
publish:
	docker build --squash --build-arg NVIDIA_DRIVER_VERSION=$(NVIDIA_DRIVER_VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
