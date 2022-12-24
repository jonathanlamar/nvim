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

    use("tpope/vim-repeat") -- General Functionality Repleat-plugin-with-.:
    use({
        "nvim-lualine/lualine.nvim",
        requires = { "kyazdani42/nvim-web-devicons", opt = true },
    })
    use("folke/which-key.nvim") -- Don't forget mappings
    use("goolord/alpha-nvim") -- Start Screen
    use("antoinemadec/FixCursorHold.nvim")
    use("christoomey/vim-tmux-navigator") -- tmux integration
    -- COLOR SCHEMES
    use("navarasu/onedark.nvim")
    use("savq/melange")
    use("sainnhe/gruvbox-material")
    use({ "catppuccin/nvim", as = "catppuccin" })
    use("tiagovla/tokyodark.nvim")
    use("rebelot/kanagawa.nvim")
    use({
        "nvim-telescope/telescope.nvim",
        requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    }) -- Fuzzy finder
    use("numToStr/Comment.nvim") -- Easily comment stuff
    use("tpope/vim-surround") -- Surround-movement-with-X:

    use("akinsho/bufferline.nvim") -- Buffer line
    use("moll/vim-bbye")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use("JoosepAlviste/nvim-ts-context-commentstring")
    use({
        "folke/zen-mode.nvim",
        requires = { "folke/twilight.nvim" },
    }) -- ADHD mode
    use("anuvyklack/pretty-fold.nvim") -- Nicer looking folds
    use({
        use { 'anuvyklack/fold-preview.nvim',
            requires = 'anuvyklack/keymap-amend.nvim',
        }
    })
    use("akinsho/toggleterm.nvim")

    -- CODING
    use("majutsushi/tagbar") -- list of objects and members on side bar.
    use({ "neoclide/coc.nvim", branch = "release" })

    -- Git integration
    use("lewis6991/gitsigns.nvim") -- See hunks in gutter
    use("junegunn/gv.vim") -- See commit history in nice UI
    use("tpope/vim-fugitive") -- Integration for git in vim.
    use("tpope/vim-rhubarb") -- This enables GBrowse and some other github-specific functionality for fugitive.
end)

if is_bootstrap then
    print '=================================='
    print '    Plugins are being installed'
    print '    Wait until Packer completes,'
    print '       then restart nvim'
    print '=================================='
    packer.sync()
    packer.compile()
end

return is_bootstrap
