# Neovim

This is my neovim config.  This is version... 3? I guess?  I used to have it in
my dotfiles repo.  I learned a lot from watching
[Chrisatmachine](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA), and
more recently, I have started to move over to lua for most of my config,
following the advice of [alpha2phi](https://alpha2phi.medium.com/).

## Installation

1. Back up your neovim config.
2. Clone this repo directly in `~/.config/nvim`.
3. Make sure the dependencies are installed.
4. In the nvim directory, create a python3 virtual environment called `venv` and
    run `pip3 install -r requirements.txt`
5. Start neovim and run `:PackerInstall`

## Dependencies

* neovim >= 0.5
* python3
* lua
* node.js
* pyright
* scala-metals
