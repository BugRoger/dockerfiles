IMAGE := bugroger/nvidia
VERSION := 384.111

.PHONY: build
build:
	docker build --no-cache --build-arg NVIDIA_DRIVER_VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg NVIDIA_DRIVER_VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


