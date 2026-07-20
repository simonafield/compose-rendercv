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

### [`rendercv-base`](/compose-typst/docker-compose.yml#L4)

**Description:** A base class defining the core [RenderCV](https://github.com/rendercv/rendercv) image (`ghcr.io/rendercv/rendercv:v2.8`). This service isn't intended to be invoked directly, but rather extended and reused by other services (inheritance).

---

### [`pip-installer`](/compose-typst/docker-compose.yml#L9)

**Description:** Installs Python packages from [`requirements.txt`](./requirements.txt) into the [rendercv-fonts](#rendercv-fonts) volume for use with Typst-based RenderCV builds.

**Example:**
```bash
docker-compose \
	--env-file .env \
	-f compose-rendercv/docker-compose.yml \
	run --rm \
	pip-installer
```

## Volumes

### [rendercv-fonts](/compose-typst/docker-compose.yml#L20)

**Description:** Persistent storage for Python packages installed for RenderCV font support.
