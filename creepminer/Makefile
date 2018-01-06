IMAGE   := bugroger/creepminer
VERSION := v201708061439

.PHONY: build
build:
	docker build -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build --no-cache -t $(IMAGE):$(VERSION) --rm --squash .


