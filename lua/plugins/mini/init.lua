return {
    {
        "nvim-mini/mini.nvim",
        config = function()
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

            require("mini.icons").setup()
            require("mini.cursorword").setup()

            -- TODO autocompletion:
            -- require("mini.completion").setup()
            -- require("mini.cmdline").setup()
            --
            -- TODO git integration:
            -- require("mini.diff").setup()
            -- require("mini.git").setup()
            --
            -- TODO misc stuff
            -- require("mini.misc").setup()
            --
            -- TODO:
            -- require("mini.tabline").setup()
            -- require("mini.statusline").setup()
            -- require("mini.starter").setup()
        end,
    },
    { import = "plugins.mini" },
}
