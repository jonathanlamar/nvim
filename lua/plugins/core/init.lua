return {
    { import = "plugins.core" },
    -- Additional text objects via treesitter
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = {
            { "nvim-treesitter/nvim-treesitter", lazy = true },
        },
    },

    -- Git integration
    { "junegunn/gv.vim", cmd = "GV" }, -- See commit history in nice UI
    { "tpope/vim-fugitive", event = "VeryLazy" }, -- Integration for git in vim.
}
