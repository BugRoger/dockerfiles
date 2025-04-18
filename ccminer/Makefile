IMAGE   := bugroger/ccminer
VERSION := 2.2.4-tpruvot

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


