return {
    -- UI ELEMENTS
    -- tmux integration
    { "christoomey/vim-tmux-navigator", event = "VeryLazy" },

    -- COLOR SCHEMES
    { "savq/melange", lazy = true },
    { "sainnhe/gruvbox-material", lazy = true },
    { "tiagovla/tokyodark.nvim", lazy = true },

    -- GENERAL EASE OF USE
    -- General Functionality Repleat-plugin-with-.:
    { "tpope/vim-repeat", event = "VeryLazy" },
    -- Surround-movement-with-X:
    { "tpope/vim-surround", event = "VeryLazy" },

    -- TREESITTER
    -- Additional text objects via treesitter
    {
        "nvim-treesitter/playground",
        cmd = "TSPlaygroundToggle",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
    },

    -- CODING
    -- LSP Configuration & Plugins
    {
        "neovim/nvim-lspconfig",
        lazy = true,
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            "j-hui/fidget.nvim",

            -- Additional lua configuration, makes nvim stuff amazing
            "folke/neodev.nvim",
        },
    },
    -- Extra functionality for languages
    {
        "jose-elias-alvarez/null-ls.nvim",
        lazy = true,
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "L3MON4D3/LuaSnip",
            "f3fora/cmp-spell",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-nvim-lsp-document-symbol",
            "hrsh7th/cmp-nvim-lsp-signature-help",
            "hrsh7th/cmp-nvim-lua",
            "hrsh7th/cmp-path",
            "lukas-reineke/cmp-under-comparator", -- Put python dunder methods later in suggestions list.
            "onsails/lspkind.nvim", -- vscode pictograms
            "saadparwaiz1/cmp_luasnip",
            "uga-rosa/cmp-dictionary",
        },
    },

    -- Git integration
    { "junegunn/gv.vim", cmd = "GV" }, -- See commit history in nice UI
    { "tpope/vim-fugitive", cmd = "Git" }, -- Integration for git in vim.
}
