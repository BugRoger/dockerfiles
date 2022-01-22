IMAGE := bugroger/octoprint
VERSION := 1.7.2-1

.PHONY: build
build:
	docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 -t $(IMAGE):$(VERSION) --rm --push .
	# docker buildx build --platform linux/amd64 -t $(IMAGE):$(VERSION) --rm --load . 

.PHONY: push
push:
	docker push $(IMAGE):$(VERSION)

.PHONY: publish 
publish:
	docker buildx ---platform linux/arm/v7 $(IMAGE):$(VERSION) --rm --squash .


