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
            color_mode = false, -- only symbols have color
            separator = " > ",
            hide_keyword = true,
            -- Play around with these
            show_file = true,
            folder_level = 2,
            respect_root = false,
        },
        definition = {
            edit = "<C-e>",
            vsplit = "<C-v>",
            split = "<C-h>",
            tabe = "<C-t>",
            quit = "q",
        },
    },
}
