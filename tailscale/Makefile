IMAGE := bugroger/tailscale
VERSION := 1.22.2

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker buildx build --platform linux/amd64,linux/arm64,linux/arm/v7 --build-arg VERDSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --push .

