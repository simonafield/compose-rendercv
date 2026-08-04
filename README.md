# compose-rendercv

## Introduction

This project provides several Docker Compose services.

The services support the following RenderCV workflows:

- RenderCV document tooling

Docker Compose permits this without installing RenderCV directly on your local machine.

## Variables

The services require the following environment variables:

- `UID` - The Unix User ID. This can be obtained by running `id -u`
- `GID` - The Unix User Group ID. This can be obtained by running `id -g`

In the following examples, the `UID` and `GID` values are stored in an `.env` file passed to Docker Compose using the `--env-file` argument.

## Services

### [`rendercv-base`](./compose-rendercv/docker-compose.yml#L4)

**Description:** A base class defining the core [RenderCV](https://github.com/rendercv/rendercv) image (`ghcr.io/rendercv/rendercv:v2.8`). This service isn't intended to be invoked directly, but rather extended and reused by other services (inheritance).
