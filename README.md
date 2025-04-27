# Docker Neverest

This repository contains a Dockerfile for [Neverest](https://github.com/pimalaya/neverest), a CLI tool to synchronize, backup, and restore emails. The Docker image is based on Alpine Linux 3.19 for minimal size.

## About Neverest

Neverest is a command-line tool that allows you to:
- Synchronize emails between IMAP servers
- Backup emails to a local maildir
- Restore emails from a local maildir to an IMAP server
- Query and manipulate emails using Notmuch

For more information, visit the [official Neverest repository](https://github.com/pimalaya/neverest).

## Docker Image Usage

### Pull the image

```bash
docker pull kszakharov/neverest:latest
```

### Running Neverest

Basic usage:

```bash
docker run --rm kszakharov/neverest:latest --help
```

With configuration and data volumes:

```bash
docker run --rm -v /path/to/config:/config -v /path/to/data:/data kszakharov/neverest:latest [command]
```

### Configuration

The Docker image uses the following directories:

- `/config`: For storing configuration files
- `/data`: For storing email data (maildir, etc.)

To create a new configuration:

```bash
docker run --rm -it -v /path/to/config:/config kszakharov/neverest:latest wizard
```

## Building Locally

To build the Docker image locally:

```bash
git clone https://github.com/kszakharov/docker-neverest.git
cd docker-neverest
docker build -t neverest:local .
```

## License

The Docker configuration in this repository is MIT licensed, following the licensing of the original Neverest project. 