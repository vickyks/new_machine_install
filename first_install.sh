# install basics

sudo apt install zsh \
         libbz2-1.0 libbz2-dev \
         libbz2-ocaml libbz2-ocaml-dev default-jdk -y

# Basic tools
sudo apt install htop net-tools curl tree tmux neovim openssh-server xclip -y
sudo apt install git docker docker-compose fzf silversearcher-ag -y

# useful to have
sudo apt install ffmpeg gimp obs obsidian binutils blender chromium-browser p7zip -y

# postgres libs
sudo apt install postgresql-contrib libpq-dev -y

# source building necessities
sudo apt install build-essential g++ gcc gdb make autoconf automake -y

# networking tools
sudo apt install nmap wget whois netcat dnsutils cifs-utils tcpdump openvpn smbclient lpr cups -y

# dev libraries
sudo apt install zlib1g-dev libncurses5-dev libffi-dev libgdbm6 \
  libc6-dev libsqlite3-dev libtool sqlite3 libgmp-dev \
  libgdbm-dev libssl-dev libreadline6-dev libyaml-dev libssl-dev -y

# python
sudo apt install python3.8 python3-pip # python

# VMs
sudo apt install virtualbox virtualbox-dkms virtualbox-ext-pack virtualbox-guest-additions-iso lxd-tools lxd

# netsec tools
sudo apt install dirb remmina hydra nikto steghide stegosuite mtr-tiny aircrack-ng wireshark radare2 bison hashcat

# Link vim and tmux settings
ln -S tmux.conf ~/.tmux.conf
ln -S vimrc ~/.vimrc

# install from scripts:
# zsh
# sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Rbenv
# curl -sL  | bash -
wget -q https://github.com/rbenv/rbenv-installer/raw/HEAD/bin/rbenv-installer -O- | bash

# sudo snap install fzf-unofficial-18-04 --edge --jailmode
sudo apt-get install fuse libfuse2 git python3-pip ack-grep -y

# For bash
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.bashrc
echo 'eval "$(rbenv init -)"' >> ~/.bashrc
source ~/.bashrc

# For zsh
echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc

rbenv install 2.7.2

# Install python
# Install python virtualenv
apt install python3-pip
pip3 install virtualenvwrapper

echo "source ~/.local/bin/virtualenvwrapper.sh" >> ~/.bashrc

# python virtualenvwrapper
echo 'export WORKON_HOME=$HOME/.virtualenvs' >> ~/.bashrc
echo 'export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3  # Replace with your Python version' >> ~/.bashrc
echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
echo 'export VIRTUALENVWRAPPER_SCRIPT=$HOME/.local/bin/virtualenvwrapper.sh' >> ~/.bashrc
echo 'source $HOME/.local/bin/virtualenvwrapper.sh' >> ~/.bashrc


# Install nodejs
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash
echo 'export NVM_DIR="$HOME/.nvm"' >>  ~/.bashrc
echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >>  ~/.bashrc
echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >>  ~/.bashrc
echo '' >>  ~/.bashrc

nvm install 17.7.2

# Install React
npm install react
npm install -g react-devtools@^4
npm install @reduxjs/toolkit
npm install redux
npm install react-redux
npm install --save-dev @redux-devtools/core


# Install Go
# TODO: actually install go
# wget 'go from somewhere'
# echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc

# Hacking tools for TryHackMe (all very legal)
# From here: https://apjone.uk/ubuntu4tryhackme/
mkdir -p sec
cd sec

# Rustscan - faster nmap
echo "Installing rustscan"
sudo dpkg -i ~/Downloads/rustscan_1.0.1_amd64.deb

# Burpsuite
echo "Installing burpsuite"
sh  -x ~/Downloads/burpsuite_community_linux_v2022_6_1.sh

# Download Seclists
git clone https://github.com/danielmiessler/SecLists.git

# Install Ghidra
sh ~/Downloads/ghidra_*_PUBLIC/ghidraRun 

# Install metasploit 
curl https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > msfinstall && \
  chmod 755 msfinstall && \
  ./msfinstall

# Installing WPScan - For scanning wordpress sites
# Evil winRM - for exploiting windows boxes
gem install wpscan evil-winrm

# better john the ripper here if needed - https://github.com/openwall/john
# This will generate the required binaries which will be stored under ~/Downloads/john/run/
git clone https://github.com/openwall/john
cd john/src
./configure
make && sudo make install
cd ~/sec

# Tool for windows boxes
# pip3 install impacket
# Alternatively
git clone https://github.com/SecureAuthCorp/impacket.git
cd impacket
pip3 install .
cd ~/sec
# Following this you should be able to run commands like smbclient.py and secretsdump.py as they get added to the /usr/local/bin directory.

# PyCTF-Helper
git clone git@github.com:apjone/pyctf-helper.git
cd pyctf-helper 
# pip3 install -r requirements.txt 
cd ~/sec

# OWASP ZAP
sudo sh -x ~/Downloads/ZAP_2_11_1_unix.sh

