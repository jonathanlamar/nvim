return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        local colors = require("kanagawa.colors").setup()

        require("kanagawa").setup({
            theme = "default",
            globalStatus = true,
            transparent = false,
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            colors = {},
            overrides = {
                WinSeparator = { fg = colors.oldWhite },
            },
        })
    end,
}
