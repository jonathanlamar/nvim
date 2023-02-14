-- Filepaths specific to this computer.
require("this_computer")

-- Automatically install packer
local install_path = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(install_path) then
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

-- I hate this, but some colorschemes require procedural commands for configuration.
-- This function handles those so I don't lose them when switching colorschemes.
_G.set_colorscheme = function(colorscheme)
    if colorscheme == "onedark" then
        require("onedark").load()
    elseif colorscheme == "melange" then
        -- TODO: Customize
        vim.cmd("colorscheme melange")
    elseif colorscheme == "gruvbox" then
        vim.cmd([[
            let g:gruvbox_material_background = 'hard'
            let g:gruvbox_material_enable_italic = 1
            let g:gruvbox_material_disable_italic_comment = 0
            let g:gruvbox_material_transparent_background = 0
            let g:gruvbox_material_visual = "grey background"
            let g:gruvbox_material_diagnostic_text_highlight = 1
            colorscheme gruvbox-material
        ]])
    elseif colorscheme == "catppuccin" then
        vim.cmd("colorscheme catppuccin")
    elseif colorscheme == "tokyodark" then
        vim.g.tokyodark_transparent_background = false
        vim.g.tokyodark_enable_italic_comment = true
        vim.g.tokyodark_enable_italic = true
        vim.g.tokyodark_color_gamma = "1.2"
        vim.cmd("colorscheme tokyodark")
    elseif colorscheme == "kanagawa" then
        vim.cmd("colorscheme kanagawa")
    elseif colorscheme == "rose-pine" then
        vim.cmd("colorscheme rose-pine")
        vim.opt["laststatus"] = 3
    else
        error("Unknown colorscheme" .. colorscheme)
    end
end

set_colorscheme("kanagawa")

require("settings")
require("keymappings")
require("autocommands")
