#!/bin/bash
set -ex

DOCKER_COMMAND="${DOCKER_COMMAND:-docker}"

set -u

$DOCKER_COMMAND build -t uboot-builder:dev .
mkdir -p "$PWD/output"
$DOCKER_COMMAND run --rm -v "$PWD/output:/workdir/output" uboot-builder:dev /workdir/build-in-container.sh
tar -acvf "odroid-hc4-uboot.tar.zst" output/
