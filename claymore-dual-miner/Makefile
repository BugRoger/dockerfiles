IMAGE   := bugroger/claymore-dual-miner
VERSION := v10.2

# See https://bitcointalk.org/index.php?topic=1433925.0

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


