#!/bin/bash
set -ex

DOCKER_COMMAND="${DOCKER_COMMAND:-docker}"

set -u

$DOCKER_COMMAND build -t uboot-builder:dev .
mkdir -p "$PWD/odroid-hc4-uboot"
$DOCKER_COMMAND run --rm -v "$PWD/odroid-hc4-uboot:/workdir/odroid-hc4-uboot" uboot-builder:dev /workdir/cross-compile.sh

truncate -s 0 release-files.txt
for file in odroid-hc4-uboot/**/*; do
    # skip folders
    if [[ -d "$file" ]]; then
        continue
    fi

    sha256sum "$file" >> release-files.txt
done

tar -acvf "odroid-hc4-uboot.tar.zst" odroid-hc4-uboot/

cat > release-notes.txt <<EOF
u-boot for odroid-hc4

unpack archive with \`tar -axvf odroid-hc4-uboot.tar.zst\`
then flash on sd card: \`cd odroid-hc4-uboot/sd_fuse && ./sd_fusing.sh /dev/<YOUR_SD_CARD>\`

all checksums are built using \`sha256sum\`!

files:
$(cat release-files.txt)

archive checksum:
$(sha256sum "odroid-hc4-uboot.tar.zst")
EOF
