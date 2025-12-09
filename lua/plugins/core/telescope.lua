-- Fuzzy finder
return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        -- { "nvim-lua/popup.nvim", lazy = true },
        { "nvim-lua/plenary.nvim", lazy = true },
    },
    event = "VeryLazy",
    config = function()
        small_dropdown = { theme = "dropdown", layout_config = { height = 20, width = 0.5 } }
        require("telescope").setup({
            defaults = {
                prompt_prefix = " ",
                selection_caret = " ",
                path_display = { "smart" },
                layout_strategy = "flex",
            },
            pickers = {
                buffers = small_dropdown,
                -- find_files = small_dropdown,
                git_branches = small_dropdown,
                -- git_commits = { theme = "dropdown" },
                -- git_bcommits = { theme = "dropdown" },
                -- git_status = { theme = "dropdown" },
                -- diagnostics = { theme = "dropdown" },
                -- lsp_document_symbols = { theme = "dropdown" },
                -- current_buffer_fuzzy_find = { theme = "dropdown" },
                -- oldfiles = { theme = "dropdown" },
                -- live_grep = { theme = "dropdown" },
            },
            extensions = {
                -- media_files = {
                --     -- filetypes whitelist
                --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
                --     filetypes = {"png", "webp", "jpg", "jpeg"},
                --     find_cmd = "rg" -- find command (defaults to `fd`)
                --   }
                -- Your extension configuration goes here:
                -- extension_name = {
                --   extension_config_key = value,
                -- }
                -- please take a look at the readme of the extension you want to configure
                --fzf = {
                --    fuzzy = true,                    -- false will only do exact matching
                --    override_generic_sorter = true,  -- override the generic sorter
                --    override_file_sorter = true,     -- override the file sorter
                --    case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                --                                     -- the default case_mode is "smart_case"
                --}
            },
        })
    end,
}
