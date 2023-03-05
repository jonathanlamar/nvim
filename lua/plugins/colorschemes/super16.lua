return {
    dir = "~/repos/super16.nvim",
    lazy = true,
    config = function()
        local c = require("super16.color")
        local themes = require("super16.themes")
        require("super16").setup({
            undercurl = false,
            commentStyle = { italic = true },
            functionStyle = {},
            keywordStyle = { italic = true },
            statementStyle = { bold = true },
            typeStyle = {},
            variablebuiltinStyle = { italic = true },
            specialReturn = true,
            specialException = true,
            transparent = false,
            dimInactive = true,
            globalStatus = true,
            terminalColors = true,
            -- Gruvbox
            colors = {
                blueBlack0 = tostring(c(themes["gruvbox"].term04Blue):lighten(0.5):saturate(0.4):hue(10)),
                blueBlack1 = tostring(c(themes["gruvbox"].term04Blue):lighten(0.6):saturate(0.9)),
                blueBlack2 = tostring(c(themes["gruvbox"].term04Blue):lighten(0.8):hue(-15)),
            },
            -- OneDark
            --[[ colors = { ]]
            --[[     orange0 = tostring(c(themes["oneDark"].term01Red):hue(40):lighten(1.2)), ]]
            --[[     orange1 = tostring(c(themes["oneDark"].term01Red):hue(30):lighten(1.2):saturate(1.1)), ]]
            --[[     orange2 = tostring(c(themes["oneDark"].term01Red):hue(20):lighten(1.2):saturate(1.1)), ]]
            --[[     brightMagenta = tostring(c(themes["oneDark"].term09BrightRed):hue(-20):saturate(0.55)), ]]
            --[[ }, ]]
            theme = "gruvbox",
        })
    end,
}
