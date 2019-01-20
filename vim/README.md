# How to install focaaby's vimrc

1. Installation: `git clone git@github.com:focaaby/dotfiles.git ~/.dotfiles`
2. Create symlinks: `ln -s ~/.dotfiles/vim/vimrc ~/.vimrc && ln -s ~/.dotfiles/vim ~/.vim`
3. Install [vim-plug](https://github.com/junegunn/vim-plug): `curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim`
4. Run Install Plugins: 
  -  Bash shell
    - `vim` and run `:PluginInstall` 
    -  In commandline : `vim +PluginInstall +qall`
5. Waiting for Downloading Your Plugin & Enjoy Vim

# Plugin List

1. [vim-plug](https://github.com/junegunn/vim-plug)
2. [Powerline](https://github.com/powerline/powerline) - Powerline is a statusline plugin for vim, and provides statuslines and prompts for several other applications. 
