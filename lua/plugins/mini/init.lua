return {
    {
        "nvim-mini/mini.nvim",
        dependencies = {
            { "moll/vim-bbye", lazy = true },
            "nvim-telescope/telescope-file-browser.nvim",
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim",
        },
        config = function()
            -- Text editing
            require("mini.pairs").setup()
            require("mini.icons").setup()
            require("mini.move").setup({
                -- Module mappings. Use `''` (empty string) to disable one.
                mappings = {
                    left = "<C-h>",
                    right = "<C-l>",
                    down = "<C-j>",
                    up = "<C-k>",

                    -- Move current line in Normal mode
                    line_left = "<C-h>",
                    line_right = "<C-l>",
                    line_down = "<C-j>",
                    line_up = "<C-k>",
                },
            })
            require("mini.splitjoin").setup()
            require("mini.surround").setup()
            require("mini.bracketed").setup()

            -- UI
            require("mini.icons").setup()
            require("mini.cursorword").setup()
            require("mini.tabline").setup()

            -- Git
            require("mini.git").setup()

            -- TODO autocompletion:
            -- require("mini.completion").setup()
            -- require("mini.cmdline").setup()
        end,
    },
    { import = "plugins.mini" },
}
