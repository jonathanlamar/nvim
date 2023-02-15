return {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    config = function()
        local colors = require("gruvbox.palette").colors
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
            contrast = "soft", -- can be "hard", "soft" or empty string
            palette_overrides = {},
            overrides = {
                -- My own inactive window dimming which is slightly less in-your-face.
                NormalNC = { fg = colors.fg0, bg = colors.dark0 },
            },
            dim_inactive = false,
            transparent_mode = false,
        })
    end,
}
