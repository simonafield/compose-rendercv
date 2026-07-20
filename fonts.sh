#!/bin/bash

set -e

# Create .env file with UID and GID
echo "UID=$(id -u)" > .env
echo "GID=$(id -g)" >> .env

docker compose \
    --env-file .env \
    -f compose-rendercv/docker-compose.yml \
    -f compose-rendercv/docker-compose-util.yml \
    run --rm \
    pip-installer
