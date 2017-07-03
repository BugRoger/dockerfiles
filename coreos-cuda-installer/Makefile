IMAGE          := bugroger/coreos-cuda-installer
COREOS_VERSION := 1409.5.0
CUDA_VERSION   := 8.0.61

.PHONY: build
build:
	docker build --build-arg COREOS_VERSION=$(COREOS_VERSION) --build-arg CUDA_VERSION=$(CUDA_VERSION) -t $(IMAGE):$(CUDA_VERSION) .

.PHONY: publish
publish:
	docker build --squash --build-arg COREOS_VERSION=$(COREOS_VERSION) --build-arg CUDA_VERSION=$(CUDA_VERSION) -t $(IMAGE):$(CUDA_VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(CUDA_VERSION)
