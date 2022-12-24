#!/bin/sh

rm -rf plugin/packer_compiled.lua
rm -rf ~/.local/share/nvim
rm -rf ~/.config/coc
rm -rf ~/.config/nvim
rm -rf ~/.cache/nvim
conda env remove -n neovim

