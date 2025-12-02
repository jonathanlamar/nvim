return {
    { import = "plugins.colorschemes" },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
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
                    }
                end,
            })
            require("kanagawa").load()
        end,
    },
}
