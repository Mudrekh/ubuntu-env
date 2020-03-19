#!/bin/bash

if [[ $EUID -eq 0 ]]; then
  echo "You must NOT run this script as ROOT" 2>&1
  exit 1
fi

export DEBIAN_FRONTEND=noninteractive

control_c()
# run if user hits control-c
{
  echo -en "\n*** Ouch! Exiting ***\n"
  exit $?
}
# trap keyboard interrupt (control-c)
trap control_c SIGINT

### URLs. Get them from their sources

# https://github.com/creationix/nvm#install-script
NVM_URL="https://raw.githubusercontent.com/creationix/nvm/master/nvm.sh"

# https://github.com/robbyrussell/oh-my-zsh#via-wget
OH_MY_ZSH_URL="https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh"

function apt_get_install {
  sudo apt-get install -y -o Dpkg::Options::="--force-confdef" -o Dpkg::Options::="--force-confold" "$@"
}

function apt_get_remove {
  sudo apt-get remove -y "$@"
}

apt_get_install build-essential make
apt_get_install zsh byobu
sh -c "$(wget $OH_MY_ZSH_URL -O -)" -s --batch

apt_get_install curl htop
apt_get_install git mercurial

# nvm, node and modules
sh -c "$(wget -qO- $NVM_URL)"
export NVM_DIR="$HOME/.nvm"
echo $NVM_DIR
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"
nvm install 10
nvm use 10
nvm alias default 10

apt_get_install ffmpeg
# https://gstreamer.freedesktop.org/documentation/installing/on-linux.html?gi-language=c
apt_get_install libgstreamer1.0-0 gstreamer1.0-plugins-base gstreamer1.0-plugins-good gstreamer1.0-plugins-bad gstreamer1.0-plugins-ugly gstreamer1.0-libav gstreamer1.0-doc gstreamer1.0-tools gstreamer1.0-x gstreamer1.0-alsa gstreamer1.0-gl gstreamer1.0-gtk3 gstreamer1.0-qt5 gstreamer1.0-pulseaudio

apt_get_install gparted
apt_get_install meld

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -O /tmp/google-chrome-stable_current_amd64.deb
apt_get_install /tmp/google-chrome-stable_current_amd64.deb

apt_get_install openvpn network-manager-openvpn
apt_get_install samba

apt_get_install vlc
apt_get_install simplescreenrecorder-lib:i386 simplescreenrecorder

apt_get_install gimp gimp-plugin-registry

sudo DEBIAN_FRONTEND=noninteractive apt-get autoremove -y
