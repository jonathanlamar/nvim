#!/usr/bin/env bash

function usageFunction() {
    echo -e "EXPLANATION: Installs the neovim config"
    echo -e "USAGE:"
    echo -e "install [--skip-cargo-pkgs] [--skip-golang-pkgs] [--skip-npm-pkgs] [--skip-python-pkgs]"
    echo -e "    OPTIONS"
    echo -e "        -n|--skip-npm-pkgs      : Whether to skip installing npm packages.  Optional, defaults to false."
    echo -e "        -p|--skip-python-pkgs   : Whether to skip installing python packages.  Optional, defaults to false."
    echo -e "        -h|--help               : prints this message."
}

SKIP_NPM_PKGS="false"
SKIP_PYTHON_PKGS="false"
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usageFunction
            exit 0;;
        -n|--skip-npm-pkgs)
            SKIP_NPM_PKGS="true"
            shift;;
        -p|--skip-python-pkgs)
            SKIP_PYTHON_PKGS="true"
            shift;;
        -*|--*)
            echo "Unknown option $1"
            exit 1;;
        *)
    esac
done


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
if [ "$SKIP_PYTHON_PKGS" == "false" ]; then
    yes | conda create -n neovim python=3.10
    conda run -n neovim bash -c "pip install -r requirements.txt"
fi

#==============
# Install js/ts formatting and linting packages
#==============
if [ "$SKIP_NPM_PKGS" == "false" ]; then
    npm install -g prettier eslint
fi

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
