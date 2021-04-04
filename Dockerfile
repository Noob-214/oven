FROM ubuntu:focal
LABEL maintainer "Dicky Herlambang <herlambangdicky50@gmail.com>"

# Indonesian timezone (GMT+7)	
ENV TZ=Asia/Jakarta
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Tidy-up
RUN apt-get update -qq && \
    apt-get upgrade -y && \
    apt-get install --no-install-recommends -y \
	autoconf \
	autogen \
	automake \
	autotools-dev \
	bc \
	binutils \
	binutils-aarch64-linux-gnu \
	binutils-arm-linux-gnueabi \
	bison \
	bzip2 \
	ca-certificates \
	coreutils \
	cmake \
	curl \
	expect \
	flex \
	g++ \
	gawk \
	gcc \
	git \
	gnupg \
	gperf \
	help2man \
	lftp \
	libc6-dev \
	libelf-dev \
	libgomp1-* \
	liblz4-tool \
	libncurses5-dev \
	libssl-dev \
	libstdc++6 \
	libtool \
	libtool-bin \
	libtinfo5 \
	m4 \
	make \
	nano \
	openjdk-8-jdk \
	openssh-client \
	openssl \
	ovmf \
	patch \
	pigz \
	python3 \
	python2 \
	rsync \
	shtool \
	subversion \
	tar \
	texinfo \
	tzdata \
	u-boot-tools \
	unzip \
	wget \
	xz-utils \
	zip \
	zlib1g-dev \
	zstd

# My Github
RUN git config --global user.name "Nicklas373"
RUN git config --global user.email "herlambangdicky5@gmail.com"

# Proton Clang 11
RUN git clone https://github.com/kdrag0n/proton-clang -b master --depth=1 /root/proton

# AOSP Clang 11
RUN git clone https://github.com/Nicklas373/aosp-clang -b r399163b --depth=1 /root/aosp-clang

# SDCLANG 10.0.9
RUN git clone https://github.com/ThankYouMario/proprietary_vendor_qcom_sdclang -b ruby --depth=1 /root/sdclang-10

# SDCLANG 8.0.12
RUN git clone https://git.rip/rama982/sdclang-8.0 -b master --depth=1 /root/sdclang-8

# GCC 4.9 (Non-elf)
RUN git clone https://github.com/KudProject/aarch64-linux-android-4.9 -b master --depth=1 /root/gcc-4.9_64
RUN git clone https://github.com/KudProject/arm-linux-androideabi-4.9 -b master --depth=1 /root/gcc-4.9
