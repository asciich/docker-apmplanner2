#!/usr/bin/env bash

set -e

echo "Start container"
VOLUMES="-v $(git rev-parse --show-toplevel):/git-repo/"
VOLUMES="${VOLUMES} -v /tmp/.X11-unix:/tmp/.X11-unix"
VOLUMES="${VOLUMES} -v ${XAUTHORITY}:${XAUTHORITY}"
ENVIRONMENT="-e DISPLAY=${DISPLAY}"
ENVIRONMENT="${ENVIRONMENT} -e XAUTHORITY=${XAUTHORITY}"
CONTAINER=asciich/apmplanner2:latest

docker run --rm --net=host --privileged ${VOLUMES} ${ENVIRONMENT} -it ${CONTAINER} /start_apmplanner2.sh
