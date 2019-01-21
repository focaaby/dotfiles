#!/bin/bash

set -xe

source ../util/print_pretty.sh

update_and_upgrade() {
    apt update && apt upgrade -y
}

install_lapt_packages() {
    success "Installing apt packages"
    apt install -y vim git curl openssh-server aptitude zsh tmux \
                    apt-transport-https ca-certificates \
                    software-properties-common \
                    fcitx fcitx-chewing

}

install_clint_packages() {
    success "Installing clint applications"
    snap install -y libreoffice spotify telegram-desktop \
                    slack --classic
}

install_chrome() {
    success "Installing Chrome"
    curl -L /Users/focaaby https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /tmp/chrome.deb
    dpkg -i /tmp/chrome.deb
    apt -f install -y
}

install_dev_tools() {
    success "Installing Dev Tools: docker, vscode"
    # docker
    curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
    add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    # vscode
    curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
    install -o root -g root -m 644 /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/
    sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'

    apt update
    apt install -y docker-ce code
    usermod -aG docker "$USER"
}

install_fonts() {
    success "Installing Source Code Pro font"
    mkdir /tmp/adodefont
    cd /tmp/adodefont
    wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
    unzip 1.050R-it.zip
    mkdir -p ~/.fonts
    cp source-code-pro-2.030R-ro-1.050R-it/OTF/*.otf ~/.fonts/
    fc-cache -f -v
}


install_zsh() {
    success "Installing Oh My ZSH"
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
}

# neet to change to zsh
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


if [ "$EUID" -ne 0 ]
then
    error "Please run as sudo privileges"
    exit
else
    update_and_upgrade
    install_apt_packages
    install_clint_packages
    install_chrome
    install_dev_tools
    install_fonts
    install_zsh
fi
