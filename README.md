# compose-rendercv

## Introduction

This project provides several Docker Compose services.

The services support the following RenderCV workflows:

- RenderCV document compilation
- Python package installation for Typst font support

Docker Compose permits this without installing RenderCV directly on your local machine.

## Variables

The services require the following environment variables:

- `UID` - The Unix User ID. This can be obtained by running `id -u`
- `GID` - The Unix User Group ID. This can be obtained by running `id -g`

In the following examples, the `UID` and `GID` values are stored in an `.env` file passed to Docker Compose using the `--env-file` argument.

## Services

### [`rendercv-base`](./compose-rendercv/docker-compose.yml#L4)

**Description:** A base class defining the core [RenderCV](https://github.com/rendercv/rendercv) image (`ghcr.io/rendercv/rendercv:v2.8`). This service isn't intended to be invoked directly, but rather extended and reused by other services (inheritance).

---

### [`pip-installer`](./compose-rendercv/docker-compose.yml#L9)

**Description:** Installs Python packages from [`requirements.txt`](./requirements.txt) into the [rendercv-fonts](#rendercv-fonts) volume for use with Typst-based RenderCV builds.

The `pip-installer` service can be started with [fonts.sh](./fonts.sh).

**Example:**
```bash
docker compose \
    --env-file .env \
    -f compose-rendercv/docker-compose.yml \
    run --rm \
    pip-installer
```

---

### [`alpine-volume`](./compose-rendercv/docker-compose.yml#L19)

**Description:** An interactive Alpine container mounting both the local project directory and the persistent Typst volumes.

- The local directory is mounted in `/data`.
- The [typst-fonts](#typst-fonts) volume is mounted in `/mnt/typst-fonts`.

The `alpine-volume` service can be started with [volume.sh](./volume.sh).

**Example:**
```bash
docker compose \
    --env-file .env \
    -f compose-rendercv/docker-compose.yml \
    run --rm \
    alpine-volume
```

## Volumes

### [typst-fonts](./compose-rendercv/docker-compose.yml#L32)

**Description:** Persistent storage for Python packages installed for Typst font support.

Access this volume by running the [alpine-volume](#alpine-volume) service.
