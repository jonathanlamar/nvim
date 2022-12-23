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
local M = {
    python_env_path = "/path/to/conda/envs",
    python_black_path = "/path/to/black",
    python_isort_path = "/path/to/isort",
}

return M
```
6. Start neovim.  Let Packer do its thing, then close and start neovim again.  Then let treesitter
   and coc do their thing.

## Dependencies

This list may not be exhaustive

* neovim >= 0.8.1
* conda
* exuberant ctags
* lua
* ripgrep - I'm still not sure about this.
