#!/usr/bin/env bash

function usageFunction() {
    echo -e "EXPLANATION: Installs the neovim config"
    echo -e "USAGE:"
    echo -e "install [--skip-cargo-pkgs] [--skip-golang-pkgs] [--skip-npm-pkgs] [--skip-python-pkgs]"
    echo -e "    OPTIONS"
    echo -e "        -c|--skip-cargo-pkgs    : Whether to skip installing cargo packages.  Optional, defaults to false."
    echo -e "        -g|--skip-golang-pkgs   : Whether to skip installing golang packages.  Optional, defaults to false."
    echo -e "        -l|--skip-luarocks-pkgs : Whether to skip installing luarocks packages.  Optional, defaults to false."
    echo -e "        -n|--skip-npm-pkgs      : Whether to skip installing npm packages.  Optional, defaults to false."
    echo -e "        -p|--skip-python-pkgs   : Whether to skip installing python packages.  Optional, defaults to false."
    echo -e "        -h|--help               : prints this message."
}

SKIP_CARGO_PKGS="false"
SKIP_GOLANG_PKGS="false"
SKIP_LUAROCKS_PKGS="false"
SKIP_NPM_PKGS="false"
SKIP_PYTHON_PKGS="false"
while [[ $# -gt 0 ]]; do
    case $1 in
        -h|--help)
            usageFunction
            exit 0;;
        -c|--skip-cargo-pkgs)
            SKIP_CARGO_PKGS="true"
            shift;;
        -g|--skip-golang-pkgs)
            SKIP_GOLANG_PKGS="true"
            shift;;
        -l|--skip-loarocks-pkgs)
            SKIP_LUAROCKS_PKGS="true"
            shift;;
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
# Install gopls LSP
#==============
if [ "$SKIP_GOLANG_PKGS" == "false" ]; then
    go install golang.org/x/tools/gopls@latest
fi

#==============
# Install js/ts formatting and linting packages
#==============
if [ "$SKIP_NPM_PKGS" == "false" ]; then
    sudo npm install -g prettier eslint
fi

#==============
# Install lua formatting package
#==============
if [ "$SKIP_CARGO_PKGS" == "false" ]; then
    cargo install stylua
fi

# Luarocks packages needed for github copilot
if [ "$SKIP_LUAROCKS_PKGS" == "false" ]; then
    sudo luarocks install --lua-version 5.1 tiktoken_core
fi

# For some reason this needs to be done
sudo rm -rf $HOME/.npm

#==============
# And we are done
#==============
echo -e "\n====== All Done!! ======\n"
