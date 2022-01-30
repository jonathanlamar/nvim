local fn = vim.fn
local execute = vim.api.nvim_command

-- Sensible defaults
require('settings')

-- Auto install packer.nvim if not exists
local install_path = fn.stdpath('data')..'/site/pack/packer/opt/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  execute('!git clone https://github.com/wbthomason/packer.nvim '..install_path)
end
vim.cmd [[packadd packer.nvim]]
vim.cmd 'autocmd BufWritePost plugins.lua PackerCompile' -- Auto compile when there are changes in plugins.lua

-- Settings specific to this computer.
-- TODO: This can interfere with fresh install of packer.
-- Comment these lines out if PackerInstall etc. are not available after cloning.
vim.cmd("source $HOME/.config/nvim/plugin/this_computer.vim")
require('this_computer')

-- Install plugins
require('plugins')

-- Key mappings
require('keymappings')

-- Another option is to groups configuration in one folder
require('config')
