#!/bin/sh

# Install homebrew
if type brew &> /dev/null; then
	echo "Homebrew already installed"
else
	echo "Installing homebrew..."
	ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install GNU core utilities (those that come with macOS are outdated).
# Don’t forget to add `$(brew --prefix coreutils)/libexec/gnubin` to `$PATH`.
brew install coreutils --with-default-names

# Install some other useful utilities like `sponge`.
brew install moreutils
# Install GNU `find`, `locate`, `updatedb`, and `xargs`, `g`-prefixed.
brew install findutils --with-default-names
# Install GNU `sed`, overwriting the built-in `sed`.
brew install gnu-sed --with-default-names
# Install Bash 4.
# Note: don’t forget to add `/usr/local/bin/bash` to `/etc/shells` before
# running `chsh`. To do so, run `sudo chsh -s /usr/local/bin/bash`.
# brew install bash
brew tap homebrew/versions
# brew install bash-completion2

# Switch to using brew-installed bash as default shell
# if ! fgrep -q '/usr/local/bin/bash' /etc/shells; then
# 	echo '/usr/local/bin/bash' | sudo tee -a /etc/shells;
# 	chsh -s /usr/local/bin/bash;
# fi;

brew tap caskroom/fonts
brew update

# Install more recent versions of some macOS tools.
brew install vim --with-override-system-vi
brew install homebrew/dupes/grep --with-default-names
brew install homebrew/dupes/openssh
brew install homebrew/dupes/screen

# Apps
brew cask install google-chrome firefox
brew cask install telegram telegram-desktop slack
brew cask install visual-studio-code sublime-text
brew cask install iterm2 docker tunnelblick postman shiftit sketch sketch-toolbox dropbox vlc steam

# Fonts
brew cask install font-source-code-pro font-source-code-pro-for-powerline

# Install tools
brew install node yarn nmap mtr tree wget git

# Install zsh
brew install zsh
&& chsh -s /bin/zsh