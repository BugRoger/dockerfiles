IMAGE   := bugroger/nvidia-settings
VERSION := v201801072159

.PHONY: build
build:
	docker build -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build -t $(IMAGE):$(VERSION) --rm --squash .


