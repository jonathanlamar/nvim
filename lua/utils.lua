-- I hate this, but some colorschemes require procedural commands for configuration.
-- This function handles those so I don't lose them when switching colorschemes.
_G.set_colorscheme = function(colorscheme)
    if colorscheme == "onedark" then
        require("onedark").load()
    elseif colorscheme == "gruvbox" then
        --[[ local colors = require("gruvbox.palette") ]]
        require("gruvbox").setup({
            undercurl = true,
            underline = true,
            bold = true,
            italic = true,
            strikethrough = true,
            invert_selection = false,
            invert_signs = false,
            invert_tabline = false,
            invert_intend_guides = false,
            inverse = true, -- invert background for search, diffs, statuslines and errors
            contrast = "hard", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                -- These do not work
                --[[ NvimTreeNormal = { bg = colors.dark0_hard }, ]]
                --[[ NvimTreeEndOfBuffer = { bg = colors.dark0_hard }, ]]
                --[[ NvimTreeNormalNC = { bg = colors.dark1 }, ]]
                --[[ NvimTreeEndOfBufferNC = { bg = colors.dark0 }, ]]
            },
            dim_inactive = false,
            transparent_mode = false,
        })
        vim.cmd("colorscheme gruvbox")
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
