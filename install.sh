#!/usr/bin/env bash

# Where is this script located
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
NVIMDIR=$HOME/.config/nvim

#==============
# Install virtual environment
#==============

if ! command -v uv &> /dev/null; then
    echo "uv is not installed. Please install uv and run this script again."
    exit 1
fi

echo "Creating virtual environment..."
uv sync
    
if [ $? -eq 0 ]; then
    echo "Virtual environment '${VENV_NAME}' created successfully."
else
    echo "Failed to create virtual environment '${VENV_NAME}'."
    exit 1
fi

#==============
# Make sure old neovim config is not present.
#==============

if [ -d $NVIMDIR ]; then
    echo "Existing neovim config found.  Please remove it and rerun this script."
    exit 1
fi

#==============
# Create symlinks in the home folder
#==============

ln -sf $SCRIPT_DIR $NVIMDIR
echo "Created the following symlinks in $HOME: $NVIMDIR -> $SCRIPT_DIR"

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
echo "Please start neovim and let all plugins and treesitter parsers install."
