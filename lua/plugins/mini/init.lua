return {
    {
        "nvim-mini/mini.nvim",
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
            require("mini.starter").setup({
                items = {
                    require("mini.starter").sections.recent_files(5, false, false),
                    require("mini.starter").sections.recent_files(5, true, false),
                    require("mini.starter").sections.sessions(5, true),
                },
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

            require("mini.sessions").setup() -- works with starter
            require("mini.extra").setup()
            -- require("mini.tabline").setup()
            -- require("mini.statusline").setup()

            -- TODO autocompletion:
            -- require("mini.completion").setup()
            -- require("mini.cmdline").setup()
            --
            -- TODO git integration:
            -- require("mini.diff").setup()
            -- require("mini.git").setup()
        end,
    },
    { import = "plugins.mini" },
}
