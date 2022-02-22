local M = {}

-- Set up color scheme options
require("colorschemes.material")
require("colorschemes.nightfox")
require("colorschemes.onedark")
require("colorschemes.catpuccin")

-- I hate this, but some colorschemes require procedural commands for configuration.
-- This function handles those so I don't lose them when switching colorschemes.
M.set_colorscheme = function(colorscheme)
    if colorscheme == "onedark" then
        require("onedark").load()
    elseif colorscheme == "material" then
        vim.g.material_style = "darker"
        vim.cmd("colorscheme material")
    elseif colorscheme == "nightfox" then
        require("nightfox").load()
    elseif colorscheme == "tokyonight" then
        vim.g.tokyonight_style = "storm"
        vim.g.tokyonight_sidebars = { "qf", "vista_kind", "terminal", "packer" }
        vim.cmd([[colorscheme tokyonight]])
    elseif colorscheme == "melange" then
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
        vim.cmd[[colorscheme catppuccin]]
    end
end

M.set_colorscheme("material")

return M
