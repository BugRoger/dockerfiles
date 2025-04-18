IMAGE   := bugroger/dstm
VERSION := 0.5.8

# See https://bitcointalk.org/index.php?topic=2021765.0

.PHONY: build
build:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --build-arg VERSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --squash .


