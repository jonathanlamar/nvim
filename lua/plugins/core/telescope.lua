-- Fuzzy finder
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        -- { "nvim-lua/popup.nvim", lazy = true },
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    event = "VeryLazy",
    config = function()
        local small_dropdown = {
            theme = "dropdown",
            previewer = false,
            layout_config = { anchor = "", height = 20, width = 0.5 },
        }
        local big_preview = {
            layout_strategy = "horizontal",
            sorting_strategy = "descending",
            layout_config = {
                prompt_position = "bottom",
                mirror = false,
                height = 0.9,
                width = 0.9,
            },
        }
        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                layout_strategy = "center",
                sorting_strategy = "ascending",
                layout_config = {
                    prompt_position = "top",
                    mirror = true,
                    anchor = "",
                    height = 15,
                    width = 120,
                },
            },
            pickers = {
                buffers = small_dropdown,
                git_branches = small_dropdown,
                git_status = big_preview,
                git_commits = big_preview,
                git_bcommits = big_preview,
                diagnostics = small_dropdown,
            },
        })
    end,
}
