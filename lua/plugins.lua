return require('packer').startup(function()

  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}



  -- General Functionality

  -- Repleat-plugin-with-.:
  use { 'tpope/vim-repeat' }

  -- Increment dates and times with C-A and C-X
  use { 'tpope/vim-speeddating' }

  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  -- Don't forget mappings
  use { 'folke/which-key.nvim' }

  -- Start Screen
  use { 'mhinz/vim-startify' }

  -- Neat icons
  use { 'ryanoasis/vim-devicons' }

  -- tmux integration
  use { 'christoomey/vim-tmux-navigator' }

  -- Color scheme
  -- use { 'sainnhe/gruvbox-material' }
  use { 'navarasu/onedark.nvim' }

  -- Fuzzy finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }

  -- Comment-in-movement
  use { 'tpope/vim-commentary' }

  -- Surround-movement-with-X:
  use { 'tpope/vim-surround' }

  use {
      'romgrk/barbar.nvim',
      requires = {'kyazdani42/nvim-web-devicons'}
  }

  use {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate'
  }

  use {
      "folke/zen-mode.nvim",
      requires = {'folke/twilight.nvim'}
  }



  -- IDE features.  Although nvim has its own LSP module, it is hard to
  -- configure directly
  use {
    'neoclide/coc.nvim',
    branch = "release",
    config = function()
      vim.cmd("source $HOME/.config/nvim/plugin/coc-nvim.vim")
    end
  }

  -- Snippets
  -- TODO: Configure
  use { 'hrsh7th/vim-vsnip' }
  use { 'cstrap/python-snippets' }
  use { 'ylcnfrht/vscode-python-snippet-pack' }

  -- Syntax highlighting for many languages
  use { 'sheerun/vim-polyglot' }

  use { 'derekwyatt/vim-scala' }

  -- Better syntax highlighting for java
  use { 'uiiaoo/java-syntax.vim' }

  -- Better syntax highlighting for markdown with support for mathjax
  use { 'godlygeek/tabular' }
  use { 'plasticboy/vim-markdown' }

  use { 'windwp/nvim-autopairs' }

  -- list of objects and members on side bar.
  use { 'majutsushi/tagbar' }

  -- Generate python docstrings
  use { 'heavenshell/vim-pydocstring', run = 'make install' }

  -- Git integration
  -- See hunks in gutter
  use { 'lewis6991/gitsigns.nvim' }

  -- See commit history in nice UI
  use { 'junegunn/gv.vim' }

  -- Integration for git in vim.
  use { 'tpope/vim-fugitive' }
  -- This enables GBrowse and some other github-specific functionality for fugitive.
  use { 'tpope/vim-rhubarb' }

end)
