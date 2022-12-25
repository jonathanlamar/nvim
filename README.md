# Neovim

This is my neovim config.  I learned a lot from watching
[Chrisatmachine](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA) and reading
[r/neovim](https://www.reddit.com/r/neovim).  The original format for this project structure came
from following the advice of [alpha2phi](https://alpha2phi.medium.com/), starting at
[this commit](https://github.com/jonathanlamar/dotfiles_OLD/tree/02130593b5a4c8ec3c1f18316a240b10b50a5f1e/.config/nvim),
where I originally broke out my long init.vim and started moving it to lua.  Some of that work is
still wrapped vimscript (i.e., `vim.cmd[[...]]`) because I am lazy.  That is cleanup work that
remains to be done.

This config is designed primarily for _coding_.  As such, it has a lot of LSP and syntax plugins.
I have it configured for python, scala, and javascript.

## Installation

1. Clone wherever you want.
2. Back up your neovim config.
3. Make sure the dependencies are installed (see below).
4. Run `./install.sh`.  The files in this repo will be symlinked to your `~/.config/nvim` folder.
5. Paste the following in `lua/this_computer.lua`.  Change to match the actual paths to your conda
   environments directories and various binaries.
   * Sorry.  It's a TODO of mine to infer the binary locations from the conda path.
```lua
local M = {
    python_black_path = "/path/to/black",
    python_env_path = "/path/to/conda/envs",
    python_isort_path = "/path/to/isort",
    python_mypy_path = "/path/to/mypy",
    python_pflake8_path = "/path/to/flake8",
    python_pydocstyle_path = "/path/to/pydocstyle",
}

return M
```
6. Start neovim.  Let Packer install all plugins.  Close neovim.
7. Start neovim again.  Let treesitter install all plugins.  The first time you use a language, the
   experience might be slow at first, but subsequently, things get better.  It is another TODO of
   mine to investigate whether this is something I should care about.

## Dependencies

This list may not be exhaustive

* neovim >= 0.8.1
* conda
* exuberant ctags
* lua
* ripgrep - I'm still not sure about this.  It might not be required for anything.
