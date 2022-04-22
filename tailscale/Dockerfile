FROM alpine:3.11 AS build

ARG TARGETARCH
ARG CHANNEL=stable
ARG VERSION=1.22.2

RUN mkdir /build
WORKDIR /build
RUN apk add --no-cache curl tar

RUN echo "https://pkgs.tailscale.com/${CHANNEL}/tailscale_${VERSION}_${TARGETARCH}.tgz"
RUN curl -vsLo tailscale.tar.gz "https://pkgs.tailscale.com/${CHANNEL}/tailscale_${VERSION}_${TARGETARCH}.tgz" && \
    tar xvf tailscale.tar.gz && \
    mv "tailscale_${VERSION}_${TARGETARCH}/tailscaled" . && \
    mv "tailscale_${VERSION}_${TARGETARCH}/tailscale" .

FROM alpine:3.11

RUN apk add --no-cache iptables

COPY --from=build /build/tailscale /usr/bin/
COPY --from=build /build/tailscaled /usr/bin/

ENTRYPOINT /usr/bin/tailscaled