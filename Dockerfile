FROM rust:1.86-alpine

RUN cargo install --git https://github.com/pimalaya/neverest.git neverest

# Create directories for configuration and storage
RUN mkdir -p /config /data

# Set volumes for configuration and data
VOLUME ["/config", "/data"]

# Set the entrypoint
ENTRYPOINT ["neverest"]
CMD ["--help"]
