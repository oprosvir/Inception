FROM debian:bookworm

RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN curl -L https://github.com/portainer/portainer/releases/download/2.21.2/portainer-2.21.2-linux-amd64.tar.gz \
    -o portainer.tar.gz && \
    tar -xzf portainer.tar.gz && \
    rm portainer.tar.gz

WORKDIR /portainer

EXPOSE 9000

CMD ["./portainer"]