IMAGE   := bugroger/claymore-dual-miner
VERSION := 9.6

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --no-cache --rm --squash .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
