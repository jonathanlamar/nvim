return {
    "marko-cerovac/material.nvim",
    lazy = false,
    config = function()
        vim.g.material_style = "darker"
        require("material").setup({
            contrast = {
                non_current_windows = true, -- Enable darker background for non-current windows
                filetypes = {}, -- Specify which filetypes get the contrasted (darker) background
            },

            styles = { -- Give comments style such as bold, italic, underline etc.
                comments = {
                    italic = true,
                },
                strings = {},
                keywords = {
                    bold = true,
                },
                functions = {
                    italic = true,
                },
                variables = {},
                operators = {},
                types = {
                    bold = true,
                },
            },

            plugins = { -- Uncomment the plugins that you use to highlight them
                -- Available plugins:
                -- "dap",
                -- "dashboard",
                "gitsigns",
                -- "hop",
                "indent-blankline",
                -- "lspsaga",
                -- "mini",
                -- "neogit",
                -- "neorg",
                "nvim-cmp",
                "nvim-navic",
                -- "nvim-tree",
                "nvim-web-devicons",
                -- "sneak",
                "telescope",
                -- "trouble",
                "which-key",
            },

            high_visibility = {
                lighter = false, -- Enable higher contrast text for lighter style
                darker = true, -- Enable higher contrast text for darker style
            },

            lualine_style = "stealth", -- Lualine style ( can be 'stealth' or 'default' )
            custom_colors = nil, -- If you want to everride the default colors, set this to a function
            custom_highlights = {
                WinSeparator = { fg = require("material.colors").editor.fg }
            }, -- Overwrite highlights with your own
        })
    end,
}
