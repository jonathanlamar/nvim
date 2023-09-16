#!/bin/sh

rm -rf ~/.local/share/nvim
rm -rf ~/.local/state/nvim
rm -rf ~/.config/coc
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
conda env remove -n neovim

