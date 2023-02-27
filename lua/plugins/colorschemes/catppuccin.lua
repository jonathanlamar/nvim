return {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    config = function()
        local style = "macchiato"
        return {
            flavour = "mocha", -- latte, frappe, macchiato, mocha
            background = { -- :h background
                light = "latte",
                dark = style,
            },
            transparent_background = false,
            term_colors = false,
            dim_inactive = {
                enabled = true,
                percentage = 0.5,
            },
            no_italic = false, -- Force no italic
            no_bold = false, -- Force no bold
            styles = {
                comments = { "italic" },
                conditionals = {},
                loops = {},
                functions = {},
                keywords = {},
                strings = { "italic" },
                variables = {},
                numbers = {},
                booleans = {},
                properties = {},
                types = {},
                operators = {},
            },
            color_overrides = {},
            custom_highlights = {},
            integrations = {
                bufferline = true,
                cmp = true,
                gitsigns = true,
                mini = false,
                notify = false,
                nvimtree = true,
                telescope = true,
                treesitter = true,
                ts_rainbow = false,
                which_key = true,
                -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
            },
        }
    end,
}
