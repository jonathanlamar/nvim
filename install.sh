#!/bin/sh

# Where is this script located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIMDIR=$HOME/.config/nvim

#==============
# Remove old neovim config
#==============
sudo rm -rf $HOME/.vimrc > /dev/null 2>&1
sudo rm -rf $HOME/.vim > /dev/null 2>&1
sudo rm -rf $NVIMDIR > /dev/null 2>&1

#==============
# Create symlinks in the home folder
#==============
ln -sf $SCRIPT_DIR $NVIMDIR
echo "Created the following symlinks in $HOME:"
echo "$NVIMDIR -> $SCRIPT_DIR"

#==============
# Install virtual environment
#==============
yes | conda create -n neovim python=3.10
conda run -n neovim bash -c "pip install -r requirements.txt"

#==============
# Install npm dependencies
sudo npm install -g prettier eslint
#==============

#==============
# Install cargo dependencies
# cargo install stylua
#==============

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
