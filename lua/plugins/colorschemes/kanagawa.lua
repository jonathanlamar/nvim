return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        local colors = require("kanagawa.colors").setup()

        require("kanagawa").setup({
            theme = "default",
            undercurl = true, -- enable undercurls
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = {},
            statementStyle = { bold = true },
            typeStyle = {},
            variablebuiltinStyle = { italic = true },
            specialReturn = true, -- special highlight for the return keyword
            specialException = true, -- special highlight for exception handling keywords
            transparent = false, -- do not set background color
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            colors = {},
            overrides = {
                WinSeparator = { fg = colors.oldWhite },
            },
        })
    end,
}
