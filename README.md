# u-boot build for odroid-hc4

based on https://wiki.odroid.com/odroid-hc4/software/building_u-boot

resulting tarball contains uboot and a script to flash it into the MBR of an sd card

uses docker or whatever docker-compliant container runtime cli you have (podman anyone?)

(remove output folder before rebuilding: `rm -rf output`)  
build uboot: `DOCKER_COMMAND=podman ./build.sh`  
unpack tarball with: `tar -axf odroid-hc4-uboot.tar.zst`
