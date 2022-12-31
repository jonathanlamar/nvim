-- Set up color scheme options
require("colorschemes.catpuccin")
require("colorschemes.kanagawa")
require("colorschemes.onedark")
require("colorschemes.rose-pine")

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

local status_ok, _ = pcall(set_colorscheme, "kanagawa")
if not status_ok then
    print("==================================")
    print("    Unable to load colorscheme")
    print("    Resolve packer issues, then")
    print("           restart nvim")
    print("==================================")
    return
end
