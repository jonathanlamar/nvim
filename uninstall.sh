#!/usr/bin/env bash

#==============
# Remove neovim cache and config links and files.
#==============

PATHS_TO_REMOVE=(
    "$HOME/.cache/nvim"
    "$HOME/.config/nvim"
    "$HOME/.config/nvim/lazy-lock.json"
    "$HOME/.local/share/nvim"
    "$HOME/.local/state/nvim"
)

remove_item() {
    if [ -d "$1" ]; then
        echo "Removing directory: $1"
        rm -rf "$1"
    elif [ -f "$1" ]; then
        echo "Removing file: $1"
        rm -f "$1"
    else
        echo "No such file or directory: $1"
    fi

    if [ $? -ne 0 ]; then
        echo "Error removing: $1"
        exit 1
    fi
}

for path in "${PATHS_TO_REMOVE[@]}"; do
    echo "Removing $path"
    remove_item "$path"
done

#==============
# Remove virtual environment
#==============

echo "Removing neovim virtual environment."
yes | pyenv uninstall neovim
if [ $? -eq 0 ]; then
    echo "Virtual environment successfully removed."
else
    echo "Failed to remove virtual environment."
    exit 1
fi
