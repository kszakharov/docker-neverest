FROM rust:1.75-alpine as builder

WORKDIR /app

# Install build dependencies
RUN apk add --no-cache \
    git \
    musl-dev \
    openssl-dev \
    pkgconfig

# Clone the repository
RUN git clone https://github.com/pimalaya/neverest.git /app
RUN cd /app

# Build the application with default features
RUN cargo build --release

# Create a smaller runtime image
FROM alpine:3.19

WORKDIR /app

# Install runtime dependencies
RUN apk add --no-cache \
    ca-certificates \
    openssl \
    tzdata

# Copy the binary from the builder stage
COPY --from=builder /app/target/release/neverest /usr/local/bin/

# Create directories for configuration and storage
RUN mkdir -p /config /data

# Set the configuration directory
ENV NEVEREST_CONFIG_DIR=/config
ENV NEVEREST_DATA_DIR=/data

# Set volumes for configuration and data
VOLUME ["/config", "/data"]

# Set the entrypoint
ENTRYPOINT ["neverest"]
CMD ["--help"]
