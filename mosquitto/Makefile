IMAGE := bugroger/mosquitto
VERSION := 2.0.15-openssl

.PHONY: build
build:
	docker buildx build --push --platform linux/amd64 --build-arg VERSION=$(VERSION) -t $(IMAGE):latest -t $(IMAGE):$(VERSION) --rm .

