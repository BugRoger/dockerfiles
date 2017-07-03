IMAGE := bugroger/nvidia
VERSION := 381.22

.PHONY: build
build:
	docker build --build-arg NVIDIA_DRIVER_VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg NVIDIA_DRIVER_VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


