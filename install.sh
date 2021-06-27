#!/bin/bash

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
SYMLINKS=()
ln -sf $SCRIPT_DIR/ $NVIMDIR
SYMLINKS+=('.config/nvim')

echo "Created the following symlinks in $HOME:"
echo ${SYMLINKS[@]}

#==============
# Install virtual environment
#==============
cd $NVIMDIR
virtualenv --system-site-packages venv
source venv/bin/activate
pip install -r requirements.txt
deactivate

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
