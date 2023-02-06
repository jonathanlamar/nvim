local fn = vim.fn

-- Automatically install packer
local is_bootstrap = false
local install_path = fn.stdpath("data") .. "/site/pack/packer/start"
if fn.empty(fn.glob(install_path)) > 0 then
    is_bootstrap = true
    fn.system({
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path .. "/packer.nvim",
    })
    print("Installing packer close and reopen Neovim...")
    vim.cmd([[packadd packer.nvim]])
end

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    return
end

-- Have packer use a popup window
packer.init({
    display = {
        open_fn = function()
            return require("packer.util").float({ border = "rounded" })
        end,
    },
})

packer.startup(function()
    -- Packer can manage itself as an optional plugin
    use("wbthomason/packer.nvim")

    -- startup time optimizer
    use("lewis6991/impatient.nvim")

    -- UI ELEMENTS
    -- Nice status line
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    -- Don't forget mappings
    use("folke/which-key.nvim")
    -- Start Screen
    use("goolord/alpha-nvim")
    -- tmux integration
    use("christoomey/vim-tmux-navigator")
    -- Buffer line
    use("akinsho/bufferline.nvim")
    -- close buffers without messing up layout
    use("moll/vim-bbye")
    -- ADHD mode
    use({
        "folke/zen-mode.nvim",
        requires = { "folke/twilight.nvim" },
    })
    -- Nicer looking folds
    use("anuvyklack/pretty-fold.nvim")
    use({ "anuvyklack/fold-preview.nvim", requires = "anuvyklack/keymap-amend.nvim" })
    -- File explorer
    use({
        "kyazdani42/nvim-tree.lua",
        requires = { "nvim-tree/nvim-web-devicons" },
    })
    -- Add indentation guides even on blank lines
    use("lukas-reineke/indent-blankline.nvim")

    -- GENERAL HACKING
    -- Terminal popup
    use("akinsho/toggleterm.nvim")
    -- Shows classpath near bufferline
    use({
        "SmiteshP/nvim-navic",
        requires = "neovim/nvim-lspconfig",
    })
    -- Fuzzy finder
    use({
        "nvim-telescope/telescope.nvim",
        branch = "0.1.x",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })
    -- Use native binary for fzf.  This removes external dependency
    -- FIXME This does not install correctly
    --use({
    --    "nvim-telescope/telescope-fzf-native.nvim",
    --    run = "make",
    --    cond = vim.fn.executable "make" == 1
    --})

    -- COLOR SCHEMES
    use("navarasu/onedark.nvim")
    use("savq/melange")
    use("sainnhe/gruvbox-material")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("tiagovla/tokyodark.nvim")
    use("rebelot/kanagawa.nvim")
    use({ "rose-pine/neovim", as = "rose-pine" })

    -- GENERAL EASE OF USE
    -- General Functionality Repleat-plugin-with-.:
    use("tpope/vim-repeat")
    -- Easily comment stuff
    use("numToStr/Comment.nvim")
    -- Surround-movement-with-X:
    use("tpope/vim-surround")
    -- Detect tabstop and shiftwidth automatically
    use("tpope/vim-sleuth")

    -- TREESITTER
    use({
        "nvim-treesitter/nvim-treesitter",
        run = function()
            pcall(require("nvim-treesitter.install").update({ with_sync = true }))
        end,
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    -- Additional text objects via treesitter
    use({
        "nvim-treesitter/nvim-treesitter-textobjects",
        after = "nvim-treesitter",
    })
    use("nvim-treesitter/playground")

    -- CODING
    -- LSP Configuration & Plugins
    use({
        "neovim/nvim-lspconfig",
        requires = {
            -- Automatically install LSPs to stdpath for neovim
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",

            -- Useful status updates for LSP
            "j-hui/fidget.nvim",

            -- Additional lua configuration, makes nvim stuff amazing
            "folke/neodev.nvim",
        },
    })
    -- Extra functionality for languages
    use({
        "jose-elias-alvarez/null-ls.nvim",
        requires = {
            "nvim-lua/plenary.nvim",
        },
    })
    -- Autocompletion
    use({
        "hrsh7th/nvim-cmp",
        requires = {
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
    })
    use({ "ray-x/lsp_signature.nvim" })
    -- Autopairs
    use({
        "windwp/nvim-autopairs",
        -- event = "InsertEnter",
    })
    -- For multi-project java workspaces at work
    use("mfussenegger/nvim-jdtls")

    -- Git integration
    use("lewis6991/gitsigns.nvim") -- See hunks in gutter
    use("junegunn/gv.vim") -- See commit history in nice UI
    use("tpope/vim-fugitive") -- Integration for git in vim.
    use("tpope/vim-rhubarb") -- This enables GBrowse and some other github-specific functionality for fugitive.
end)

if is_bootstrap then
    print("==================================")
    print("    Plugins are being installed")
    print("    Wait until Packer completes,")
    print("       then restart nvim")
    print("==================================")
    packer.sync()
    packer.compile()
end

return is_bootstrap
