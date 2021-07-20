FROM docker.io/ubuntu:18.04

RUN export DEBIAN_FRONTEND=noninteractive \
	&& dpkg --add-architecture i386 \
	&& apt-get update \
	&& apt-get install -y git lzop build-essential gcc bc libncurses5-dev libc6-i386 lib32stdc++6 zlib1g:i386 wget

WORKDIR /workdir

RUN wget https://releases.linaro.org/archive/13.11/components/toolchain/binaries/gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz
RUN wget https://releases.linaro.org/archive/14.04/components/toolchain/binaries/gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz

RUN mkdir -p /opt/toolchains \
	&& tar xf gcc-linaro-aarch64-none-elf-4.8-2013.11_linux.tar.xz -C /opt/toolchains/ \
	&& tar xf gcc-linaro-arm-none-eabi-4.8-2014.04_linux.tar.xz -C /opt/toolchains/

RUN git clone https://github.com/hardkernel/u-boot.git -b odroidg12-v2015.01

ADD build-in-container.sh .
