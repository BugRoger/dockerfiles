IMAGE   := bugroger/burstcoin
VERSION := 1.2.9

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


