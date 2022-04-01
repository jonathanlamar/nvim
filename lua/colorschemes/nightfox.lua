require("nightfox").setup({
    transparent = false, -- Disable setting the background color
    terminal_colors = false, -- Configure the colors used when opening :terminal
    options = {
        styles = {
            comments = "italic", -- Style that is applied to comments: see `highlight-args` for options
            functions = "bold", -- Style that is applied to functions: see `highlight-args` for options
            keywords = "NONE", -- Style that is applied to keywords: see `highlight-args` for options
            strings = "NONE", -- Style that is applied to strings: see `highlight-args` for options
            variables = "NONE", -- Style that is applied to variables: see `highlight-args` for options
        },
        inverse = {
            match_paren = false, -- Enable/Disable inverse highlighting for match parens
            visual = false, -- Enable/Disable inverse highlighting for visual selection
            search = true, -- Enable/Disable inverse highlights for search highlights
        },
        dim_inactive = true, -- Non current window bg to alt color see `hl-NormalNC`
    }
})
