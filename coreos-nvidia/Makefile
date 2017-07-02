IMAGE          := bugroger/coreos-nvidia
COREOS_VERSION := 1409.5.0
DRIVER_VERSION := 381.22
VERSION        := $(COREOS_VERSION)-$(DRIVER_VERSION)



.PHONY: build
build:
	docker build --build-arg COREOS_VERSION=$(COREOS_VERSION) --build-arg DRIVER_VERSION=$(DRIVER_VERSION) -t bugroger/coreos-nvidia:$(VERSION) .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
