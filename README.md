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
		* NOTE: This does not work unless run as user.  I need to figure out a
			workaround for that.
5. Place any settings specific to this amchine in a `lua/this_computer.lua` or
   `plugin/this_computer.vim` (create blank files if no settings are required).
6. Start neovim and run `:PackerInstall`.

## Dependencies

* neovim >= 0.5
* packer
* python3
* conda
* lua
* node.js
* pyright
* scala-metals
* black python linter
