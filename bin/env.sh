#!/usr/bin/env bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"
cd $(dirname ${SCRIPT_DIR}/../..)

source "${SCRIPT_DIR}/../.env"

COMPOSE="docker-compose --project-name ${COMPOSE_PROJECT_NAME} --file docker-compose.yml"
