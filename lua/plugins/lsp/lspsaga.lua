return {
    "glepnir/lspsaga.nvim",
    event = "BufRead",
    dependencies = {
        { "nvim-tree/nvim-web-devicons" },
        --Please make sure you install markdown and markdown_inline parser
        { "nvim-treesitter/nvim-treesitter" },
    },
    opts = {
        symbol_in_winbar = {
            enable = true, -- Putting this in statusline instead
            separator = " > ",
            hide_keyword = true,
            -- Play around with these
            show_file = true,
            folder_level = 2,
            respect_root = false,
        },
        finder = {
            keys = {
                toggle_or_open = "<CR>",
                vsplit = "v",
                split = "h",
            },
        },
    },
}
