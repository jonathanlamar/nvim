return {
    -- Add indentation guides even on blank lines
    "lukas-reineke/indent-blankline.nvim",
    event = "VeryLazy",
    config = {
        char = "┊",
        show_trailing_blankline_indent = false,
    },
}