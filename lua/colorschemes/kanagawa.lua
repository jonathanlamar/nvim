local colors = require("kanagawa.colors").setup()

require("kanagawa").setup({
    undercurl = true, -- enable undercurls
    commentStyle = "italic",
    functionStyle = "NONE",
    keywordStyle = "NONE",
    statementStyle = "bold",
    typeStyle = "NONE",
    variablebuiltinStyle = "italic",
    specialReturn = true, -- special highlight for the return keyword
    specialException = true, -- special highlight for exception handling keywords
    transparent = false, -- do not set background color
    dimInactive = true, -- dim inactive window `:h hl-NormalNC`
    colors = {},
    overrides = {
        CocErrorSign = { fg = colors.samuraiRed },
        CocWarningSign = { fg = colors.roninYellow },
        CocInfoSign = { fg = colors.crystalBlue },
        CocHintSign = { fg = colors.springGreen },
        CocErrorVirtualText = { link = "CocErrorSign" },
        CocWarningVirtualText = { link = "CocWarningSign" },
        CocInfoVirtualText = { link = "CocInfoSign" },
        CocHintVirtualText = { link = "CocHintSign" },

        -- CocErrorHighlight
        -- CocWarningHighlight
        -- CocInfoHighlight
        -- CocHintHighlight
        -- CocDeprecatedHighlight
        -- CocErrorLine
        -- CocWarningLine
        -- CocInfoLine
        -- CocHintLine
    },
})

-- Example:
-- local default_colors = require("kanagawa.colors").setup()
--
-- -- this will affect all the hl-groups where the redefined colors are used
-- local my_colors = {
--     -- use the palette color name...
--     sumiInk1 = "black",
--     fujiWhite = "#FFFFFF",
--     -- ...or the theme name
--     bg = "#272727",
--     -- you can also define new colors if you want
--     -- this will be accessible from require("kanagawa.colors").setup()
--     -- AFTER calling require("kanagawa").setup(config)
--     new_color = "teal"
-- }
--
-- local overrides = {
--     -- create a new hl-group using default palette colors and/or new ones
--     MyHlGroup1 = { fg = default_colors.waveRed, bg = "#AAAAAA", style="underline,bold", guisp="blue" },
--
--     -- override existing hl-groups, the new keywords are merged with existing ones
--     VertSplit  = { fg = default_colors.bg_dark, bg = "NONE" },
--     TSError    = { link = "Error" },
--     TSKeywordOperator = { style = 'bold'},
--     StatusLine = { fg = my_colors.new_color }
-- }
