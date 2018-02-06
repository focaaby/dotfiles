#!/bin/bash

sudo apt update 
sudo apt upgrade -y

echo "##########"
echo "### Install curl openssh-server git aptitude"
echo "##########"

sudo apt install -y vim git curl openssh-server aptitude apt-transport-https ca-certificates software-properties-common \
                        fcitx fcitx-chewing \
		        zsh	

# Install Google Chrome 
echo "##########"
echo "### Install Google Chrome"
echo "##########"
curl -O -L https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb
sudo apt -f install -y
sudo rm google-chrome-stable_current_amd64.deb

# Install Docker 
echo "##########"
echo "### Install Docker"
echo "##########"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository -y "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update 
sudo apt install -y docker-ce
sudo usermod -aG docker $USER

# Install Telegram
echo "##########"
echo "### Install Telegram"
echo "##########"
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt update
sudo apt install -y telegram

# Install Java
echo "##########"
echo "### Install Java"
echo "##########"
sudo add-apt-repository -y ppa:webupd8team/java
sudo apt update
echo "oracle-java8-installer shared/accepted-oracle-license-v1-1 select true" | sudo debconf-set-selections
sudo apt install -y oracle-java8-installer

# Install VSCode 
echo "##########"
echo "### Install VSCode"
echo "##########"
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > /tmp/microsoft.gpg
sudo mv /tmp/microsoft.gpg /etc/apt/trusted.gpg.d/microsoft.gpg
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt update
sudo apt install -y code

# Install Adobe fonts: Source Code Pro
echo "##########"
echo "### Install Fonts: Source Code Pro"
echo "##########"
mkdir /tmp/adodefont
cd /tmp/adodefont
wget https://github.com/adobe-fonts/source-code-pro/archive/2.030R-ro/1.050R-it.zip
unzip 1.050R-it.zip 
mkdir -p ~/.fonts
cp source-code-pro-2.030R-ro-1.050R-it/OTF/*.otf ~/.fonts/
fc-cache -f -v

# Install oh my zsh 
echo "##########"
echo "### Install Oh My Zsh"
echo "##########"
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
sudo chsh -s $(which zsh)
