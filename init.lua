local fn = vim.fn
local execute = vim.api.nvim_command

vim.cmd 'let g:python3_host_prog = \'$HOME/opt/miniconda3/envs/neovim/bin/python\''
vim.cmd 'let g:tagbar_ctags_bin = \'$CTAGS\''

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Another option is to groups configuration in one folder
require('config')
