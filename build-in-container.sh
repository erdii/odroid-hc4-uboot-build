#!/bin/bash
set -eux

export ARCH=arm64
export CROSS_COMPILE=aarch64-none-elf-
export PATH=/opt/toolchains/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux/bin:/opt/toolchains/gcc-linaro-arm-none-eabi-4.8-2014.04_linux/bin:$PATH

aarch64-none-elf-gcc -v
arm-none-eabi-gcc -v

cd u-boot
make odroidc4_defconfig
make
mv sd_fuse ../output
