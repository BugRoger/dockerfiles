IMAGE          := bugroger/coreos-nvidia-installer
COREOS_VERSION := 1576.5.0
DRIVER_VERSION := 384.111
VERSION        := $(COREOS_VERSION)-$(DRIVER_VERSION)

.PHONY: build
build:
	docker build --build-arg COREOS_VERSION=$(COREOS_VERSION) --build-arg DRIVER_VERSION=$(DRIVER_VERSION) -t $(IMAGE):$(VERSION) .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
