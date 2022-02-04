local fn = vim.fn
local execute = vim.api.nvim_command

-- Automatically install packer
local install_path = require("this_computer").packer_path
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

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

return packer.startup(function()
	-- Packer can manage itself as an optional plugin
	use({ "wbthomason/packer.nvim" })

	-- General Functionality
	-- Repleat-plugin-with-.:
	use({ "tpope/vim-repeat" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "kyazdani42/nvim-web-devicons", opt = true },
	})
	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
	-- Don't forget mappings
	use({ "folke/which-key.nvim" })
	-- Start Screen
	-- use({ "mhinz/vim-startify" })
	use({ "goolord/alpha-nvim" })
	use({ "antoinemadec/FixCursorHold.nvim" })
	-- tmux integration
	use({ "christoomey/vim-tmux-navigator" })
	-- Color scheme
	use({ "navarasu/onedark.nvim" })
	-- Fuzzy finder
	use({
		"nvim-telescope/telescope.nvim",
		requires = { { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
	})
	-- Easily comment stuff
	use("numToStr/Comment.nvim")
	-- Surround-movement-with-X:
	use({ "tpope/vim-surround" })

	-- Buffer line
	use("akinsho/bufferline.nvim")
	use("moll/vim-bbye")
	-- This is useful or something.  IDK.
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("p00f/nvim-ts-rainbow")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	-- ADHD mode
	use({
		"folke/zen-mode.nvim",
		requires = { "folke/twilight.nvim" },
	})
	-- Nicer looking folds
	use({ "anuvyklack/pretty-fold.nvim" })
	use({ "akinsho/toggleterm.nvim" })

	-- CODING
	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	use("hrsh7th/cmp-nvim-lua")
	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use
	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters
	use({ "windwp/nvim-autopairs" })
	-- list of objects and members on side bar.
	use({ "majutsushi/tagbar" })

	-- Git integration
	-- See hunks in gutter
	use({ "lewis6991/gitsigns.nvim" })
	-- See commit history in nice UI
	use({ "junegunn/gv.vim" })
	-- Integration for git in vim.
	use({ "tpope/vim-fugitive" })
	-- This enables GBrowse and some other github-specific functionality for fugitive.
	use({ "tpope/vim-rhubarb" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
