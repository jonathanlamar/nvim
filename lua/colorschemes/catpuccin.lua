require("catppuccin").setup({
    transparent_background = false,
    term_colors = false,
    styles = {
        comments = "italic",
        functions = "NONE",
        keywords = "NONE",
        strings = "NONE",
        variables = "NONE",
    },
    integrations = {
        treesitter = true,
        gitsigns = true,
        telescope = true,
        which_key = true,
        bufferline = true,
        ts_rainbow = false,
    },
})
