#!/bin/bash
set -ex

DOCKER_COMMAND="${DOCKER_COMMAND:-docker}"

set -u

$DOCKER_COMMAND build -t uboot-builder:dev .
mkdir -p "$PWD/odroid-hc4-uboot"
$DOCKER_COMMAND run --rm -v "$PWD/odroid-hc4-uboot:/workdir/odroid-hc4-uboot" uboot-builder:dev /workdir/cross-compile.sh
tar -acvf "odroid-hc4-uboot.tar.zst" odroid-hc4-uboot/
