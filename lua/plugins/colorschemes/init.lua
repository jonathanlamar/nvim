-- I hate this, but some colorschemes require procedural commands for configuration.
-- This function handles those so I don't lose them when switching colorschemes.
_G.set_colorscheme = function(colorscheme)
    if colorscheme == "gruvbox-material" then
        local fg_palette = "material"
        vim.g.gruvbox_material_background = "medium"
        vim.g.gruvbox_material_foreground = fg_palette
        vim.g.gruvbox_material_enable_bold = 1
        vim.g.gruvbox_material_enable_italic = 1
        vim.g.gruvbox_material_transparent_background = 0 -- or 1, 2
        vim.g.gruvbox_material_dim_inactive_windows = 1
        vim.g.gruvbox_material_diagnostic_text_highlight = 1
        vim.g.gruvbox_material_diagnostic_line_highlight = 1
        vim.g.gruvbox_material_statusline_style = fg_palette
        vim.g.gruvbox_material_better_performance = 1
        --[[ vim.g.gruvbox_material_colors_override = { } ]]
        vim.cmd("colorscheme gruvbox-material")
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#d4be98" })
        vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#5a524c", bg = "NONE" })
    elseif colorscheme == "kanagawa" then
        require("kanagawa").load()
    elseif colorscheme == "onedark" then
        require("onedark").load()
    elseif colorscheme == "sonokai" then
        vim.g.sonokai_style = "default"
        vim.g.sonokai_better_performance = 1
        vim.g.sonokai_enable_italic = 1
        vim.g.sonokai_transparent_background = 1
        vim.g.sonokai_dim_inactive_windows = 0
        vim.g.sonokai_diagnostic_text_highlight = 1
        vim.g.sonokai_diagnostic_line_highlight = 1
        vim.g.sonokai_diagnostic_virtual_text = "colored"
        vim.g.sonokai_disable_terminal_colors = 1
        vim.cmd("colorscheme sonokai")
        vim.api.nvim_set_hl(0, "WinSeparator", { fg = "#e2e2e3" })
    elseif colorscheme == "super16" then
        require("super16").load()
    else
        vim.cmd("colorscheme " .. colorscheme)
    end
end

return {
    { import = "plugins.colorschemes" },
    { "savq/melange", lazy = true },
    { "sainnhe/sonokai", lazy = true },
    { "sainnhe/gruvbox-material", lazy = true },
}
