#!/bin/bash

# Actualizar el sistema
echo "Actualizando el sistema..."
sudo apt update && sudo apt upgrade -y

# Instalar paquetes esenciales
echo "Instalando paquetes esenciales..."
sudo apt install -y \
        build-essential \
        stow \
        curl \
        git \
        dkms \
        maim \
        linux-headers-$(uname -r) \
        htop \
        unzip \
        tmux \
        nodejs \
        npm \
        gcc \
        make \
        clang \
        pipewire \
        pipewire-audio \
        pipewire-pulse \
        piperwire-audio-client-libraries \
        wireplumber \
        alsa-utils \
        xorg \
        libx11-dev \
        libxext-dev \
        libxft-dev \
        xclip \
        iwd \
        pkg-config \
        libxinerama-dev
        # libssl-dev \
        # libffi-dev \
        # libsqlite3-dev \
        # libbz2-dev \
        # libreadline-dev

# instalar dotfiles
echo "Instalando dotfiles"
cd ~
git clone https://github.com/AGomezCuervo/dotfiles.git
cd dotfiles
stow --adopt .

# Instalar suckless
echo "Instalando suckless"
cd ~/.config/suckless/dwm/src
sudo make clean install

cd ~/.config/suckless/st/
sudo make clean install

cd ~/.config/slstatus
sudo make clean install

cd ~/.config/scroll
sudo make clean install

# Instalar Neovim
echo "Instalando Neovim"
sudo mkdir -p /usr/local/bin && cd /usr/local/bin
curl -LO https://github.com/neovim/neovim/releases/download/v0.10.2/nvim-linux64.tar.gz 
tar xzvf nvim-linux64.tar.gz
rm nvim-linux64.tar.gz
sudo ln -s ./nvim-linux64/bin/nvim ./nvim


# Instalar aplicaciones graficas
echo "Instalando aplicaciones gráficas..."
sudo apt install -y \
        vlc \
        firefox-esr \

#Instalar nvidia drivers
sudo apt install -y \
        nvidia-detect \
        nvidia-driver \

# Limpiar el sistema después de la instalación
echo "Limpiando el sistema..."
sudo apt autoremove -y
sudo apt clean

# Finalización
echo "Instalación completada. Por favor, reinicie su sistema para que los cambios tengan efecto."

exit 0
