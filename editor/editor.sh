# remove old neovim installation
rm -rf ~/.config/nvim
rm -rf ~/.local/share/nvim

# install dependencies of neovim
sudo apt-get install ripgrep

wget https://github.com/ryanoasis/nerd-fonts/releases/download/v3.0.1/DroidSansMono.zip
unzip DroidSansMono.zip -d ~/.fonts
fc-cache -fv

# install neovim from sources
## deps
sudo apt-get install ninja-build gettext cmake unzip curl
## cloning sources and install
cd /tmp/
git clone https://github.com/neovim/neovim
cd neovim
make CMAKE_BUILD_TYPE=RelWithDebInfo
sudo make install

# install NvChad
git clone https://github.com/NvChad/NvChad ~/.config/nvim --depth 1

# copy custom config
cp -r ./custom/* ~/.config/nvim/lua/custom/

echo INSTRUCTION: set terminal font to DoidSansMono
