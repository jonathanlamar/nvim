-- I hate this, but some colorschemes require procedural commands for configuration.
-- This function handles those so I don't lose them when switching colorschemes.
_G.set_colorscheme = function(colorscheme)
    if colorscheme == "material" then
        vim.g.material_style = "darker"
        vim.cmd("colorscheme material")
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
        --[[ vim.api.nvim_set_hl(0, "EndOfBuffer", {bg="#FFFFFF"}) ]]
    elseif colorscheme == "tokyodark" then
        vim.g.tokyodark_transparent_background = false
        vim.g.tokyodark_enable_italic_comment = true
        vim.g.tokyodark_enable_italic = true
        vim.g.tokyodark_color_gamma = "1.2"
        vim.cmd("colorscheme tokyodark")
    else
        vim.cmd("colorscheme " .. colorscheme)
    end
end

return {
    { import = "plugins.colorschemes" },
    { "savq/melange", lazy = true },
    { "sainnhe/sonokai", lazy = true },
    { "marko-cerovac/material.nvim", lazy = true },
}
