FROM ubuntu:18.04
LABEL maintainer="nakat-t <armaiti.wizard@gmail.com>" \
      description="My local gcc-9 on ubuntu 18.04 image."

RUN    apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends software-properties-common \
	&& add-apt-repository ppa:ubuntu-toolchain-r/test \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
		build-essential \
		gcc-9 \
		g++-9 \
		gcc-9-multilib \
		g++-9-multilib \
		xutils-dev \
		patch \
		git \
		python3 \
		python3-pip \
		libpulse-dev \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/*

RUN    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 10 \
	&& update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 20 \
	&& update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 10 \
	&& update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-9 20

WORKDIR /data
