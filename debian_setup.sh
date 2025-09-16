#!/bin/bash

ORIGINAL_DIR=$(pwd)
SOURCE_PATH="$HOME/sources"
BINARY_PATH="/usr/local/bin"

set -euo pipefail

if [ "$EUID" -ne 0 ]; then
  echo "Error: This script should be executed with root privileges." >&2
  exit 1
fi

mkdir -p "$SOURCE_PATH"

apt update && apt upgrade -y

apt install -y \
	build-essential \
	stow \
	curl \
	git \
	dkms \
	linux-headers-$(uname -r) \
	btop \
	unzip \
	tmux \
	nodejs \
	npm \
	gcc \
	make \
	clang \
	gdb \
	pipewire \
	pipewire-audio \
	pipewire-pulse \
	piperwire-audio-client-libraries \
	wireplumber \
	alsa-utils \
	wmenu \
	foot \
	chromium \

	libinput-dev \
	libwayland-dev \
	libwlroots-0.18-dev \
	libxkbcommon-dev \
	wayland-protocols \
	pkg-config \
	libfcft-dev \
    libpixman-1-dev \

	libxcb1-dev \
	libxcb-util-dev \
	libxcb-icccm4-dev \
	xwayland \

	cd "$HOME/dotfiles"
	stow --adopt .
	cd "$SOURCE_PATH"

# Installing neovim
mkdir -p "${BINARY_PATH}"
curl -LO https://github.com/neovim/neovim/releases/download/nightly/nvim-linux-x86_64.tar.gz
tar xzvf nvim-linux-x86_64.tar.gz
rm nvim-linux-x86_64.tar.gz
ln -s ./nvim-linux-x86_64/bin/nvim "${BINARY_PATH}"/nvim

# Installing dwl
git clone https://codeberg.org/dwl/dwl.git
(
	cd dwl
	git checkout 0.7
	curl -LO https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/bar/bar-0.7.patch
	git apply bar-0.7.patch
	sed -i "s/firefox\w*/chromium/i" ./config.def.h
	sed -i "s/ALT$/LOGO/" ./config.def.h
	sed -i "s/#X/X/" ./config.mk
	make config.h install
)

# Extras
git clone https://github.com/JPGomezCuervo/calculator.git
(
	cd calculator
	make install
)

git clone https://github.com/nakst/gf.git
(
	cd gf
	./build.sh
	mv ./gf2 "$BINARY_PATH"
)

# Nvidia
apt install -y \
        nvidia-detect \
        nvidia-driver \

apt autoremove -y
apt clean

echo "Installation completed. Restart the computer"
cd "$ORIGINAL_DIR" 

exit 0
