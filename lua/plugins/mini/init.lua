return {
    {
        "nvim-mini/mini.nvim",
        dependencies = {
            { "moll/vim-bbye", lazy = true },
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

            -- UI
            require("mini.icons").setup()
            require("mini.cursorword").setup()
            local starter = require("mini.starter")
            starter.setup({
                items = {
                    starter.sections.builtin_actions(),
                    starter.sections.telescope(),
                    starter.sections.recent_files(5, false, false),
                },
                -- content_hooks = {
                --     starter.gen_hook.adding_bullet(),
                --     starter.gen_hook.indexing("all", { "Builtin actions" }),
                -- },
                header = ""
                    .. "                                               ▓█               \n"
                    .. "                                               ▓█               \n"
                    .. "                                                                \n"
                    .. "                                                                \n"
                    .. "░█░▒██▓      ▒███▓      ▒███▒    █▓     █▓   ▓███      █▒██▒▒██ \n"
                    .. "░██▒░░█▓    ▓█▓░▒██    ██▓▒▓█▓   ▓█    ░█▒    ░▓█      ██ ▓█▓ █▓\n"
                    .. "░█▓   ▒█   ░█▒    █▒  ░█▒   ▓█░  ░█▒   ▒█      ▒█      █▒ ░█░ ▒█\n"
                    .. "░█▒   ▒█   ▓█     █▓  ▓█    ░█▒   █▓   █▓      ▒█      █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░  ████████▓  ▓█     █▓   ▒█  ░█░      ▒█      █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░  ██░░░░░░   ▓█     █▓   ░█▒ ▒█       ▒█      █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░  ▓█         ▓█    ░█▒    █▓ █▓       ▒█      █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░  ▒█▒        ░█▒   ▓█░    ▒█░█░       ░█░     █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░   ▓█▓▒▒▒█▒   ██▓▒▓█▓      ███         ██▒░░  █▒ ░█░ ▒█\n"
                    .. "░█░   ░█░    ▒████▒     ▓███▒       ██▓         ░▓██▒  █▒ ░█░ ▒█\n"
                    .. "                                                                \n",
            })
            require("mini.statusline").setup()
            require("mini.tabline").setup()

            -- Git
            require("mini.diff").setup({
                view = {
                    signs = {
                        add = "┃",
                        change = "┃",
                        delete = "_",
                    },
                },
                mappings = {
                    apply = "",
                    reset = "",
                    textobject = "",
                    goto_first = "",
                    goto_prev = "",
                    goto_next = "",
                    goto_last = "",
                },
            })
            require("mini.git").setup()

            -- TODO autocompletion:
            -- require("mini.completion").setup()
            -- require("mini.cmdline").setup()
        end,
    },
    { import = "plugins.mini" },
}
