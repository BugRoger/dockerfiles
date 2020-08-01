FROM ubuntu:20.04

RUN apt-get update && \
    apt-get -y --no-install-recommends install curl gnupg ca-certificates && \
    curl https://pkgs.tailscale.com/stable/ubuntu/focal.gpg | apt-key add - && \
    curl https://pkgs.tailscale.com/stable/ubuntu/focal.list | tee /etc/apt/sources.list.d/tailscale.list && \
    apt-get update && \
    apt-get -y --no-install-recommends install tailscale=0.100.0~153 && \
    apt-get purge -y curl gnupg && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /var/lib/tailscale

ENTRYPOINT tailscaled --state=/var/lib/tailscale/tailscaled.state
