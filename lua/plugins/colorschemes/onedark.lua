return {
    "navarasu/onedark.nvim",
    lazy = true,
    config = function()
        local palette = require("onedark.palette")
        local style = "warmer"
        --[[ local active_background = palette[style].black ]]
        --[[ local nc_background = palette[style].bg0 ]]
        local lsp_ref_bg = palette[style].bg2

        require("onedark").setup({
            -- Main options --
            style = style, -- Default theme style. Choose between 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer' and 'light'
            transparent = false, -- Show/hide background
            term_colors = true, -- Change terminal color as per the selected theme style
            ending_tildes = true, -- Show the end-of-buffer tildes. By default they are hidden
            -- toggle theme style ---
            -- toggle_style_key = "<leader>to", -- Default keybinding to toggle
            -- toggle_style_list = { "dark", "darker", "cool", "deep", "warm", "warmer", "light" }, -- List of styles to toggle between

            -- Change code style ---
            -- Options are italic, bold, underline, none
            -- You can configure multiple style with comma seperated, For e.g., keywords = 'italic,bold'
            code_style = {
                comments = "italic",
                keywords = "none",
                functions = "none",
                strings = "italic",
                variables = "none",
            },
            -- Custom Highlights --
            colors = {}, -- Override default colors
            highlights = {
                VertSplit = { fg = "$fg" },
                --[[ Normal = { fg = "$fg", bg = active_background }, ]]
                --[[ NonText = { fg = "NONE", bg = active_background }, ]]
                --[[ NormalNC = { fg = "$fg", bg = nc_background }, ]]
                --[[ NonTextNC = { fg = "NONE", bg = nc_background }, ]]
                EndOfBuffer = { bg = "NONE" },
                SignColumn = { bg = "NONE" },
                LspReferenceRead = { fmt = "none", bg = lsp_ref_bg },
                LspReferenceWrite = { fmt = "none", bg = lsp_ref_bg },
                LspReferenceText = { fmt = "none", bg = lsp_ref_bg },
                --[[ NeoTreeNormal = { bg = active_background }, ]]
                --[[ NeoTreeNormalNC = { fg = "NONE", bg = nc_background }, ]]
                --[[ NeoTreeEndOfBuffer = { bg = active_background }, ]]
            }, -- Override highlight groups
            -- Plugins Config --
            diagnostics = {
                darker = true, -- darker colors for diagnostic
                undercurl = true, -- use undercurl instead of underline for diagnostics
                background = true, -- use background color for virtual text
            },
        })
    end,
}
