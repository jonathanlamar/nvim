# Neovim

This is my neovim config.  This is version... 3? I guess?  I used to have it in
my dotfiles repo.  I learned a lot from watching
[Chrisatmachine](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA), and
more recently, I have started to move over to lua for most of my config,
following the advice of [alpha2phi](https://alpha2phi.medium.com/).

This config is designed primarily for _coding_.  As such, it has a lot of LSP
and syntax plugins.  I have it configured for python, scala, and javascript.

## Installation

1. Clone wherever you want.
2. Back up your neovim config.
3. Make sure the dependencies are installed.
4. Run `./install.sh`.  The files in this repo will be symlinked to your
   `~/.config/nvim` folder.
    * NOTE: This does not work unless run as user.  I need to figure out a workaround for that.
5. Paste the following in `lua/this_computer.lua`.  Change as needed.
```lua
local fn = vim.fn
local M = {}

local packer_path = fn.stdpath("data") .. "/site/pack/packer/start"
M.packer_path = packer_path

-- Your computer-specific settings (binary paths, etc.) go here
vim.cmd("let g:python3_host_prog = '/opt/homebrew/Caskroom/miniforge/base/envs/neovim/bin/python'")
vim.cmd("let g:tagbar_ctags_bin = '$CTAGS'")
-- Even coc-settings.json stuff can go here:
vim.cmd("call coc#config('python.venvPath', '/opt/homebrew/Caskroom/miniforge/base/envs')")
vim.cmd("call coc#config('python.formatting.blackPath', '/opt/homebrew/Caskroom/miniforge/base/envs/neovim/bin/black')")
vim.cmd("call coc#config('python.sortImports.path', '/usr/local/bin/isort')")

return M
```
6. Start neovim.  Let Packer do its thing, then close and start neovim again.  Then let treesitter
   do its thing.

## Dependencies

* neovim >= 0.5
* conda
* exuberant ctags
* lua
* python3
* ripgrep
