return {
    "rebelot/kanagawa.nvim",
    lazy = true,
    config = function()
        require("kanagawa").setup({
            theme = "wave",
            compile = true,
            undercurl = false,
            globalStatus = true,
            transparent = false,
            dimInactive = true, -- dim inactive window `:h hl-NormalNC`
            colors = {
                -- Remove gutter bg
                theme = {
                    all = {
                        ui = {
                            bg_gutter = "none",
                        },
                    },
                },
            },
            -- Remember to run :KanagawaCompile when changing this!
            overrides = function(colors)
                return {
                    -- Bright separators
                    WinSeparator = { fg = colors.palette.oldWhite },

                    -- update kanagawa to handle new treesitter highlight captures
                    ["@string.regexp"] = { link = "@string.regex" },
                    ["@variable.parameter"] = { link = "@parameter" },
                    ["@exception"] = { link = "@exception" },
                    ["@string.special.symbol"] = { link = "@symbol" },
                    ["@markup.strong"] = { link = "@text.strong" },
                    ["@markup.italic"] = { link = "@text.emphasis" },
                    ["@markup.heading"] = { link = "@text.title" },
                    ["@markup.raw"] = { link = "@text.literal" },
                    ["@markup.quote"] = { link = "@text.quote" },
                    ["@markup.math"] = { link = "@text.math" },
                    ["@markup.environment"] = { link = "@text.environment" },
                    ["@markup.environment.name"] = { link = "@text.environment.name" },
                    ["@markup.link.url"] = { link = "Special" },
                    ["@markup.link.label"] = { link = "Identifier" },
                    ["@comment.note"] = { link = "@text.note" },
                    ["@comment.warning"] = { link = "@text.warning" },
                    ["@comment.danger"] = { link = "@text.danger" },
                    ["@diff.plus"] = { link = "@text.diff.add" },
                    ["@diff.minus"] = { link = "@text.diff.delete" },
                    ["@comment.todo"] = { link = "@text.todo" },
                }
            end,
        })
    end,
}
