IMAGE   := bugroger/coreos-kubernetes-installer
VERSION := wupse.d26a.de

.PHONY: build
build:
	docker build -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)
