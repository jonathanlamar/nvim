-- Filepaths specific to this computer.
require("this_computer")

-- Detection for if this is the first time booting
local is_bootstrap = false

-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then
    is_bootstrap = true
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        install_path,
    })
end
vim.opt.rtp:prepend(install_path)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
    return
end

-- For some reason we have to do this before lazy runs..?
vim.g.mapleader = " "
vim.g.maplocalleader = " "

lazy.setup("plugins")

if is_bootstrap then
    print("Plugin installation complete.  Quit and restart neovim to get all settings.")
    return
end

require("utils")
require("settings")
require("keymappings")
require("autocommands")

set_colorscheme("melange")
