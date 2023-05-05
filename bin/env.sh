#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $(dirname ${SCRIPT_DIR}/../..)

COMPOSE="docker compose --file docker-compose.yml --env-file .env"
