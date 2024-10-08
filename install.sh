#!/usr/bin/env bash

# Where is this script located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIMDIR=$HOME/.config/nvim

#==============
# Remove old neovim config
#==============
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
which pyenv || echo "PYENV NOT INSTALLED"; exit 1
test -d $PYENV_ROOT/versions/3.10.14 || yes | pyenv install 3.10.14
test -d $PYENV_ROOT/versions/3.10.14/envs/neovim || pyenv virtualenv 3.10.14 neovim
pyenv activate neovim && pip install -r requirements.txt

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
