IMAGE := bugroger/tailscale
VERSION := 0.100.0-153

.PHONY: build
build:
	DOCKER_BUILDKIT=1 docker buildx build --platform linux/amd64,linux/arm64 --build-arg VERDSION=$(VERSION) -t $(IMAGE):$(VERSION) --rm --push .

