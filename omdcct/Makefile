IMAGE   := bugroger/omdcct
VERSION := v201707081812

.PHONY: build
build:
	docker build -t $(IMAGE):$(VERSION) --rm .

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker build -t $(IMAGE):$(VERSION) --rm --squash .


