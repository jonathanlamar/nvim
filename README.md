# Neovim

This is my neovim config. I learned a lot from watching
[Chrisatmachine](https://www.youtube.com/channel/UCS97tchJDq17Qms3cux8wcA) when I originally decided to break out my
super long init.vim into a project around 2020
[here](https://github.com/jonathanlamar/dotfiles_OLD/tree/7b9cee94ce475eecd810c2a267794e254067323f/.config/nvim).
I also learned a lot reading [r/neovim](https://www.reddit.com/r/neovim). The original format for this project structure
came from following the advice of [alpha2phi](https://alpha2phi.medium.com/), starting at
[this commit](https://github.com/jonathanlamar/dotfiles_OLD/tree/02130593b5a4c8ec3c1f18316a240b10b50a5f1e/.config/nvim),
where I originally broke out my long init.vim and started moving it to lua. Some of that work is still wrapped vimscript
(i.e., `vim.cmd[[...]]`) because I was lazy. Most recently, I have switched to
[lazy.nvim](https://github.com/folke/lazy.nvim) for my package management, and that has allowed me to refactor further.
I still don't think it makes much sense though...

This config is designed primarily for _coding_. As such, it has a lot of LSP and syntax plugins. I have it configured
mainly for python, scala, and javascript, since those are the languages I use the most.

## Installation

1. Clone wherever you want.
2. Back up your neovim config.
3. Make sure the dependencies are installed (see below).
4. Run `./install.sh`. The files in this repo will be symlinked to your `~/.config/nvim` folder.
5. Paste the following in `lua/this_computer.lua`. Change to match the actual path to the neovim conda environment that
   was created during the install script.
   - Yeah, I know. It's a minor TODO to infer this automatically.

```lua
return {
    python_env_path = "/path/to/pyenv/envs/neovim",
}
```

6. Paste the following in `lua/personal_config.lua`. Change to match the actual values that you want to set.

```lua
return {
    code_textwidth = 88,
    prose_textwidth = 120,
    colorscheme = "kanagawa",
    lualineTheme = "auto",
    windowPickerFgColor = "#c8c093",
    windowPickerBgColor1 = "#7e9cd8",
    windowPickerBgColor2 = "#727169",
}
```

7. Start neovim. Lazy will install all plugins, treesitter will install parsers, and mason/lspconfig will install
   language server configs. Close neovim once this is done.
8. Start neovim again. Some lazy-loaded plugins may install dependencies the first time they are invoked, but it should
   be good to go at this point.

## Dependencies

This list may not be exhaustive

- neovim >= 0.10
- pyenv
- stylua
- ripgrep (for telescope.nvim)
